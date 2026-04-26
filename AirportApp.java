import javax.swing.*;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

import java.awt.*;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
import java.util.Map;
import java.util.LinkedHashMap;
import javax.swing.text.Style;
import javax.swing.text.StyleConstants;
import javax.swing.text.StyledDocument;

public class AirportApp {

    static final String DB_URL = "jdbc:mysql://localhost:3306/Airport_management_system";
    static final String USER   = "root";
    static final String PASS   = "Vijay@1234";

    static final Color ACCENT = new Color(0, 153, 255);
    static final Font TITLE_FONT = new Font("Segoe UI", Font.BOLD, 22);

    static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, USER, PASS);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(AirportApp::buildMainFrame);
    }

    // ─────────────── MAIN FRAME ───────────────
    static void buildMainFrame() {
        JFrame frame = new JFrame("Airport Management System");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(750, 520);
        frame.setLocationRelativeTo(null);

        BackgroundPanel bg = new BackgroundPanel("C:\\Users\\VIJAY TELANGE\\Downloads\\flight_bg.jpg");
        bg.setLayout(new GridBagLayout());

        JPanel card = new JPanel(new GridBagLayout());
        card.setBackground(new Color(10, 20, 40, 200));
        card.setBorder(BorderFactory.createLineBorder(ACCENT, 2, true));
        card.setPreferredSize(new Dimension(360, 300));

        GridBagConstraints gc = new GridBagConstraints();
        gc.insets = new Insets(10, 30, 10, 30);
        gc.fill = GridBagConstraints.HORIZONTAL;
        gc.gridx = 0;

        JLabel title = new JLabel("✈ Airport Management System", SwingConstants.CENTER);
        title.setFont(TITLE_FONT);
        title.setForeground(Color.WHITE);
        gc.gridy = 0;
        card.add(title, gc);

        JButton searchBtn = styledButton("🔍 Search Passenger");
        searchBtn.addActionListener(e -> showSearchPassenger(frame));

        JButton ticketBtn = styledButton("🎫 View Tickets");
        ticketBtn.addActionListener(e -> showTickets(frame));

        JButton addBtn = styledButton("➕ Add Passenger");
        addBtn.addActionListener(e -> showAddPassenger(frame));

        gc.gridy = 1; card.add(searchBtn, gc);
        gc.gridy = 2; card.add(ticketBtn, gc);
        gc.gridy = 3; card.add(addBtn, gc);

        bg.add(card);
        frame.setContentPane(bg);
        frame.setVisible(true);
        JButton allPassengerBtn = styledButton("📋 Show All Passengers");
allPassengerBtn.addActionListener(e -> showAllPassengers(frame));

gc.gridy = 4;
card.add(allPassengerBtn, gc);

   JButton bookingBtn = styledButton("🧾 Create Booking_ID");
bookingBtn.addActionListener(e -> showBooking(frame));

gc.gridy = 5;
card.add(bookingBtn, gc);

JButton ticketBookingBtn = styledButton("🎫 Ticket Booking");
ticketBookingBtn.addActionListener(e -> showTicketBooking(frame));

gc.gridy = 6;
card.add(ticketBookingBtn, gc);


    }

    //Ticcket Booking
    static void showTicketBooking(JFrame parent) {

    JTextField passengerId = new JTextField();
    JTextField source = new JTextField();
    JTextField destination = new JTextField();
    JTextField seatNo = new JTextField();
    JTextField price = new JTextField();

    Object[] fields = {
            "Passenger ID", passengerId,
            "Boarding", source,
            "Destination", destination,
            "Seat No", seatNo,
            "Price", price
    };

    int result = JOptionPane.showConfirmDialog(parent, fields,
            "Ticket Booking", JOptionPane.OK_CANCEL_OPTION);

    if (result != JOptionPane.OK_OPTION) return;

    try (Connection con = getConnection()) {

        int pid = Integer.parseInt(passengerId.getText());
        String src = source.getText();
        String dest = destination.getText();
        String seat = seatNo.getText();
        double pr = Double.parseDouble(price.getText());

        // 🔥 Get Flight_ID using Source & Destination
        String flightQuery = "SELECT Flight_ID FROM Flight WHERE Source=? AND Destination=? LIMIT 1";
        PreparedStatement ps1 = con.prepareStatement(flightQuery);

        ps1.setString(1, src);
        ps1.setString(2, dest);

        ResultSet rs = ps1.executeQuery();

        if (!rs.next()) {
            JOptionPane.showMessageDialog(parent, "❌ No flight found for given route");
            return;
        }

        int flightId = rs.getInt("Flight_ID");

        // 🔥 Generate Ticket ID (4-digit)
        int ticketId;
        do {
            ticketId = (int)(Math.random() * 9000) + 1000;
        } while (ticketExists(con, ticketId));

        // 🔥 Insert Ticket
        String insertSQL = "INSERT INTO Ticket (Ticket_ID, Passenger_ID, Flight_ID, Seat_No, Price) VALUES (?,?,?,?,?)";

        PreparedStatement ps2 = con.prepareStatement(insertSQL);

        ps2.setInt(1, ticketId);
        ps2.setInt(2, pid);
        ps2.setInt(3, flightId);
        ps2.setString(4, seat);
        ps2.setDouble(5, pr);

        ps2.executeUpdate();

        JOptionPane.showMessageDialog(parent,
                "🎫 Ticket Booked!\n\n" +
                "Ticket ID: " + ticketId +
                "\nFlight ID: " + flightId +
                "\nRoute: " + src + " → " + dest);

    } catch (Exception e) {
        JOptionPane.showMessageDialog(parent, e.getMessage());
    }
}
    
  //Booking
  static void showBooking(JFrame parent) {

    JTextField passengerId = new JTextField();

    Object[] fields = {
            "Enter Passenger ID", passengerId
    };

    Object[] options = {"Confirm", "Pending", "Cancel"};

    int choice = JOptionPane.showOptionDialog(parent, fields,
            "Booking", JOptionPane.DEFAULT_OPTION,
            JOptionPane.PLAIN_MESSAGE, null,
            options, options[0]);

    if (choice == -1) return;

    String status = "";

    if (choice == 0) status = "Confirmed";
    else if (choice == 1) status = "Pending";
    else if (choice == 2) status = "Cancelled";

    try (Connection con = getConnection()) {

        int pid = Integer.parseInt(passengerId.getText());

        // 🔥 Generate 4-digit ID
        int bookingId = (int)(Math.random() * 9000) + 1000;

        // Dates
        java.sql.Date bookingDate = new java.sql.Date(System.currentTimeMillis());

        java.util.Calendar cal = java.util.Calendar.getInstance();
        cal.setTime(bookingDate);
        cal.add(java.util.Calendar.DATE, 10);
        java.sql.Date departureDate = new java.sql.Date(cal.getTimeInMillis());

        String sql = "INSERT INTO Booking (Booking_ID, Passenger_ID, Booking_date, Status, Departure_Date) VALUES (?,?,?,?,?)";

        PreparedStatement ps = con.prepareStatement(sql);

        ps.setInt(1, bookingId);
        ps.setInt(2, pid);
        ps.setDate(3, bookingDate);
        ps.setString(4, status);   // 🔥 STATUS SET HERE
        ps.setDate(5, departureDate);

        ps.executeUpdate();

        JOptionPane.showMessageDialog(parent,
                "Booking Done!\nStatus: " + status +
                "\nBooking ID: " + bookingId);

    } catch (Exception e) {
        JOptionPane.showMessageDialog(parent, e.getMessage());
    }
}
     static boolean ticketExists(Connection con, int id) throws SQLException {
    PreparedStatement ps = con.prepareStatement(
        "SELECT 1 FROM Ticket WHERE Ticket_ID=?"
    );
    ps.setInt(1, id);
    ResultSet rs = ps.executeQuery();
    return rs.next();
}
    //Show All Passenger Data
    static void showAllPassengers(JFrame parent) {

    String sql = "SELECT * FROM Passenger";

    try (Connection con = getConnection();
         Statement stmt = con.createStatement();
         ResultSet rs = stmt.executeQuery(sql)) {

        // Table Columns
        String[] columns = {"ID", "Name", "Age", "Gender", "Phone"};

        // Data List
        java.util.List<Object[]> dataList = new ArrayList<>();

        while (rs.next()) {
            dataList.add(new Object[]{
                    rs.getInt("Passenger_ID"),
                    rs.getString("Name"),
                    rs.getInt("Age"),
                    rs.getString("Gender"),
                    rs.getString("Phone")
            });
        }

        if (dataList.isEmpty()) {
            JOptionPane.showMessageDialog(parent, "No passengers found");
            return;
        }

        // Convert List → Array
        Object[][] data = new Object[dataList.size()][5];
        for (int i = 0; i < dataList.size(); i++) {
            data[i] = dataList.get(i);
        }

        // Create Table
        JTable table = new JTable(data, columns);
        table.setRowHeight(25);
        table.setFont(new Font("Segoe UI", Font.PLAIN, 14));

        JScrollPane scroll = new JScrollPane(table);

        // Dialog
        JDialog dialog = new JDialog(parent, "All Passengers", true);
        dialog.setSize(600, 400);
        dialog.setLocationRelativeTo(parent);
        dialog.add(scroll);

        dialog.setVisible(true);

    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(parent, ex.getMessage());
    }
} 
    // ─────────────── SEARCH PASSENGER ───────────────
    static void showSearchPassenger(JFrame parent) {

    // 🔁 CHANGED: ID → NAME (only this line changed)
    String name = JOptionPane.showInputDialog(parent, "Enter Passenger Name:");
    if (name == null || name.trim().isEmpty()) return;

    String sql =
        "SELECT p.Passenger_ID, p.Name, " +
        "b.Booking_ID, b.Booking_date, b.Status, b.Departure_Date, " +
        "t.Ticket_ID, t.Seat_No, t.Price AS Ticket_Price, " +
        "f.Flight_Name, f.Source, f.Destination, " +
        "f.Departure_Time, f.Arrival_Time, " +
        "g.Gate_Number, a.Airport_Name " +
        "FROM Passenger p " +
        "LEFT JOIN Booking b ON p.Passenger_ID = b.Passenger_ID " +
        "LEFT JOIN Ticket t ON p.Passenger_ID = t.Passenger_ID " +
        "LEFT JOIN Flight f ON t.Flight_ID = f.Flight_ID " +
        "LEFT JOIN Gate g ON f.Flight_ID = g.Flight_ID " +
        "LEFT JOIN Airport a ON f.Source = a.City " +
        "WHERE p.Name LIKE ? LIMIT 1";   // 🔁 CHANGED

    try (Connection con = getConnection();
         PreparedStatement ps = con.prepareStatement(sql)) {

        // 🔁 CHANGED: setString instead of setInt
        ps.setString(1, "%" + name + "%");

        ResultSet rs = ps.executeQuery();

        if (!rs.next()) {
            JOptionPane.showMessageDialog(parent, "Passenger not found");
            return;
        }

        // ✅ SAME YOUR LOGIC (NO CHANGE)
        String details =
                "✈ PASSENGER DETAILS\n" +
                "--------------------------------\n" +
                "Passenger ID : " + rs.getString("Passenger_ID") + "\n" +
                "Name         : " + rs.getString("Name") + "\n\n" +

                "Booking ID   : " + rs.getString("Booking_ID") + "\n" +
                "Booking Date : " + rs.getString("Booking_date") + "\n" +
                "Status       : " + rs.getString("Status") + "\n\n" +

                "Flight       : " + rs.getString("Flight_Name") + "\n" +
                "From         : " + rs.getString("Source") +
                "   To: " + rs.getString("Destination") + "\n" +
                "Date         : " + rs.getString("Departure_Date") + "\n" +
                "Boarding Time : " + rs.getString("Departure_Time") +
                "   Arrival Time: " + rs.getString("Arrival_Time") + "\n\n" +

                "Seat         : " + rs.getString("Seat_No") +
                "   Gate: " + rs.getString("Gate_Number") + "\n" +
                "Ticket ID    : " + rs.getString("Ticket_ID") + "\n" +
                "Price        : ₹ " + rs.getString("Ticket_Price") + "\n\n" +

                "Airport      : " + rs.getString("Airport_Name") + "\n" +
                "--------------------------------";

        JTextArea area = new JTextArea(details);
        area.setFont(new Font("Monospaced", Font.BOLD, 14));
        area.setEditable(false);
        area.setBackground(new Color(10,20,40));
        area.setForeground(Color.WHITE);

        JOptionPane.showMessageDialog(parent, new JScrollPane(area),
                "Passenger Details", JOptionPane.PLAIN_MESSAGE);

    } catch (SQLException ex) {
        JOptionPane.showMessageDialog(parent, ex.getMessage());
    }
}
    // ─────────────── VIEW TICKETS ───────────────
    static void showTickets(JFrame parent) {

        String sql =
                "SELECT t.Ticket_ID, f.Flight_Name, f.Source, f.Destination, " +
                "g.Gate_Number, f.Departure_Time, b.Departure_Date, t.Seat_No,b.Status " +
                "FROM Ticket t " +
                "JOIN Booking b ON t.Passenger_ID = b.Passenger_ID " +
                "JOIN Flight f ON t.Flight_ID = f.Flight_ID " +
                "JOIN Gate g ON f.Flight_ID = g.Flight_ID";

        try (Connection con = getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            List<String> ids = new ArrayList<>();
            Map<String, String[][]> map = new LinkedHashMap<>();

            while (rs.next()) {
                String tid = rs.getString("Ticket_ID");

                ids.add(tid);
                map.put(tid, new String[][]{
                        {"Ticket ID", tid},
                        {"Flight Name", rs.getString("Flight_Name")},
                        {"Source", rs.getString("Source")},
                        {"Destination", rs.getString("Destination")},
                        {"Gate No", rs.getString("Gate_Number")},
                        {"Departure Date", rs.getString("Departure_Date")},
                        {"Departure Time", rs.getString("Departure_Time")},
                        {"Seat No", rs.getString("Seat_No")},
                        {"Status", rs.getString("Status")},
                });
            }

            if (ids.isEmpty()) {
                JOptionPane.showMessageDialog(parent, "No tickets found");
                return;
            }

            String selected = (String) JOptionPane.showInputDialog(parent,
                    "Select Ticket ID", "Tickets",
                    JOptionPane.PLAIN_MESSAGE, null,
                    ids.toArray(), ids.get(0));

            if (selected != null)
                showTicketDialog(parent, map.get(selected));

        } catch (SQLException ex) {
            JOptionPane.showMessageDialog(parent, ex.getMessage());
        }
    }

    // ✈ TICKET FORMAT UI
   static void showTicketDialog(JFrame parent, String[][] data) {

    JDialog dialog = new JDialog(parent, "Flight Ticket", true);
    dialog.setSize(420, 380);
    dialog.setLocationRelativeTo(parent);

    JTextPane pane = new JTextPane();
    pane.setEditable(false);
    pane.setBackground(new Color(10, 20, 40));

    StyledDocument doc = pane.getStyledDocument();

    // Styles
    Style normal = pane.addStyle("normal", null);
    StyleConstants.setForeground(normal, Color.WHITE);
    StyleConstants.setFontFamily(normal, "Monospaced");
    StyleConstants.setFontSize(normal, 14);

    Style green = pane.addStyle("green", null);
    StyleConstants.setForeground(green, Color.GREEN);

    Style orange = pane.addStyle("orange", null);
    StyleConstants.setForeground(orange, Color.ORANGE);

    Style red = pane.addStyle("red", null);
    StyleConstants.setForeground(red, Color.RED);

    // Extract values
    String flight="", from="", to="", date="", time="";
    String seat="", gate="", id="", status="";

    for (String[] row : data) {
        switch (row[0]) {
            case "Flight Name": flight = row[1]; break;
            case "Source": from = row[1]; break;
            case "Destination": to = row[1]; break;
            case "Departure Date": date = row[1]; break;
            case "Departure Time": time = row[1]; break;
            case "Seat No": seat = row[1]; break;
            case "Gate No": gate = row[1]; break;
            case "Ticket ID": id = row[1]; break;
            case "Status": status = row[1]; break;
        }
    }

    try {
        // Normal text
        doc.insertString(doc.getLength(),
                "✈ FLIGHT TICKET\n" +
                "--------------------------------\n" +
                "Flight: " + flight + "\n" +
                "From: " + from + "        To: " + to + "\n\n" +
                "Date: " + date + "\n" +
                "Time: " + time + "\n\n" +
                "Seat: " + seat + "        Gate: " + gate + "\n" +
                "Ticket ID: " + id + "\n" +
                "Status: ", normal);

        // 🎯 Colored Status
        Style statusStyle = normal;

        if (status != null) {
            if (status.equalsIgnoreCase("Confirmed")) statusStyle = green;
            else if (status.equalsIgnoreCase("Pending")) statusStyle = orange;
            else if (status.equalsIgnoreCase("Cancelled")) statusStyle = red;
        }

        doc.insertString(doc.getLength(), status + "\n", statusStyle);

        doc.insertString(doc.getLength(),
                "--------------------------------", normal);

    } catch (Exception e) {
        e.printStackTrace();
    }

    dialog.add(new JScrollPane(pane));
    dialog.setVisible(true);
}
    // ─────────────── ADD PASSENGER ───────────────
    static void showAddPassenger(JFrame parent) {

        JTextField id = new JTextField();
        JTextField name = new JTextField();
        JTextField age = new JTextField();
        JTextField phone = new JTextField();

        JComboBox<String> gender = new JComboBox<>(new String[]{"Male","Female","Other"});

        Object[] fields = {"ID", id, "Name", name, "Age", age, "Gender", gender, "Phone", phone};

        if (JOptionPane.showConfirmDialog(parent, fields, "Add Passenger",
                JOptionPane.OK_CANCEL_OPTION) == JOptionPane.OK_OPTION) {

            try (Connection con = getConnection();
                 PreparedStatement ps = con.prepareStatement(
                         "INSERT INTO Passenger VALUES (?,?,?,?,?)")) {

                ps.setInt(1, Integer.parseInt(id.getText()));
                ps.setString(2, name.getText());
                ps.setInt(3, Integer.parseInt(age.getText()));
                ps.setString(4, gender.getSelectedItem().toString());
                ps.setString(5, phone.getText());

                ps.executeUpdate();
                JOptionPane.showMessageDialog(parent, "Passenger Added");

            } catch (Exception e) {
                JOptionPane.showMessageDialog(parent, e.getMessage());
            }
        }
    }

    // ─────────────── BUTTON STYLE ───────────────
    static JButton styledButton(String text) {
        JButton btn = new JButton(text);
        btn.setBackground(ACCENT);
        btn.setForeground(Color.WHITE);
        return btn;
    }

    // ─────────────── BACKGROUND PANEL ───────────────
    static class BackgroundPanel extends JPanel {
        private Image bg;

        BackgroundPanel(String path) {
            bg = new ImageIcon(path).getImage();
        }

        protected void paintComponent(Graphics g) {
            super.paintComponent(g);
            g.drawImage(bg, 0, 0, getWidth(), getHeight(), this);

            g.setColor(new Color(0,0,0,120));
            g.fillRect(0,0,getWidth(),getHeight());
        }
    }
}