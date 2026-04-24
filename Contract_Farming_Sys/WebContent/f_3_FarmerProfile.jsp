
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*,com.connection.ConnectionDB" %>
<%
HttpSession session1 = request.getSession();
Integer userId = (Integer) session1.getAttribute("userId");

String name="", email="", phone="", address="";

if(userId != null){

    Connection con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/contract_farming_db",
        "root",
        ""
    );

    PreparedStatement ps = con.prepareStatement("SELECT * FROM farmer WHERE Id=?");
    ps.setInt(1, userId);

    ResultSet rs = ps.executeQuery();

    if(rs.next()){
        name = rs.getString("FName");
        email = rs.getString("FEmail");
        phone = rs.getString("FContact");
        address = rs.getString("FAddress");
    }
}
%>


<%
Connection con = ConnectionDB.connect();

PreparedStatement psCrop = null;
ResultSet rsCrop = null;

if(userId != null){
    psCrop = con.prepareStatement("SELECT * FROM crops WHERE farmer_id=?");
    psCrop.setInt(1, userId);
    rsCrop = psCrop.executeQuery();
}
%>

<tbody>
<%
while(rsCrop.next()){
%>
<tr>
    <td>🌾 <%= rsCrop.getString("crop_name") %></td>
    <td><%= rsCrop.getString("price") %></td>
    <td>
        <span class="status active">
            <%= rsCrop.getString("status") %>
        </span>
    </td>
    <td><%= rsCrop.getString("HarvestDate") %></td>
    <td>
        <button class="action-btn edit">Edit</button>
        <button class="action-btn delete">Delete</button>
    </td>
</tr>
<%
}
%>
</tbody> 
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - Crop Management</title>
    <link rel="stylesheet" href="css/f_3_FarmerProfile.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar">
        <div class="nav-brand">
            <i class="fas fa-seedling"></i>
            <span>CropHub</span>
        </div>
        <div class="nav-search">
            <i class="fas fa-search"></i>
            <input type="text" placeholder="Search crops, buyers...">
        </div>
        <div class="nav-actions">
            <div class="notification">
                <i class="fas fa-bell"></i>
                <span class="badge">3</span>
            </div>
            <div class="user-profile">
                <img src="https://via.placeholder.com/40x40/667eea/ffffff?text=JD" alt="User">
                <span>John Doe</span>
                <i class="fas fa-chevron-down"></i>
            </div>
        </div>
    </nav>

    <div class="dashboard-container">
        <!-- Sidebar -->
        <aside class="sidebar">
            <nav class="sidebar-nav">
                <ul>
                    <li class="nav-item active" data-page="dashboard">
                        <i class="fas fa-tachometer-alt"></i>
                        <span>Dashboard</span>
                    </li>
                    <li class="nav-item" data-page="profile">
                        <i class="fas fa-user"></i>
                        <span>Profile</span>
                    </li>
                    <li class="nav-item" data-page="mycrops">
                        <i class="fas fa-seedling"></i>
                        <span>My Crops</span>
                    </li>
                    <li class="nav-item" data-page="addcrop">
                        <i class="fas fa-plus-circle"></i>
                        <span>Add Crop</span>
                    </li>
                    <li class="nav-item" data-page="contracts">
                        <i class="fas fa-file-contract"></i>
                        <span>Contract Requests</span>
                    </li>
                    <li class="nav-item" data-page="payments">
                        <i class="fas fa-credit-card"></i>
                        <span>Payments</span>
                    </li>
                    <li class="nav-item" data-page="buyers">
                        <i class="fas fa-users"></i>
                        <span>Find Buyers</span>
                    </li>
                    <li class="nav-item logout" data-page="logout">
                        <i class="fas fa-sign-out-alt"></i>
                        <span>Logout</span>
                    </li>
                </ul>
            </nav>
        </aside>

        <!-- Main Content -->
        <main class="main-content">
            <!-- Dashboard Page -->
            <section id="dashboard" class="content-page active">
                <div class="page-header">
                    <h1>Dashboard</h1>
                    <p>Welcome back, Here's what's happening with your crops.</p>
                </div>
                
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon green"><i class="fas fa-seedling"></i></div>
                        <div class="stat-info">
                            <h3>12</h3>
                            <p>Total Crops</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon blue"><i class="fas fa-file-contract"></i></div>
                        <div class="stat-info">
                            <h3>5</h3>
                            <p>Pending Contracts</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon orange"><i class="fas fa-credit-card"></i></div>
                        <div class="stat-info">
                            <h3>4,250</h3>
                            <p>Total Earnings</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon purple"><i class="fas fa-users"></i></div>
                        <div class="stat-info">
                            <h3>23</h3>
                            <p>Buyers Contacted</p>
                        </div>
                    </div>
                </div>

                <div class="cards-grid">
                    <div class="card">
                        <h3>Recent Crops</h3>
                        <div class="crop-list">
                            <div class="crop-item">
                                <span class="crop-icon">🌾</span>
                                <div>
                                    <h4>Wheat</h4>
                                    <p>5 acres - Ready for harvest</p>
                                </div>
                                <span class="status active">Active</span>
                            </div>
                            <div class="crop-item">
                                <span class="crop-icon">🍅</span>
                                <div>
                                    <h4>Tomatoes</h4>
                                    <p>3 acres - Growing</p>
                                </div>
                                <span class="status pending">Pending</span>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <h3>Upcoming Payments</h3>
                        <ul>
                            <li><strong>ABC Buyers:</strong> $1,200 - Due in 3 days</li>
                            <li><strong>XYZ Corp:</strong> $850 - Due in 7 days</li>
                        </ul>
                    </div>
                </div>
            </section>

            <!-- Profile Page -->
            <section id="profile" class="content-page">
                <div class="page-header">
                    <h1>Profile</h1>
                    <p>Manage your account information</p>
                </div>
                <div class="profile-content">
                    <div class="profile-card">
                        <div class="profile-avatar">
                            <img src="https://via.placeholder.com/120x120/667eea/ffffff?text=JD" alt="Profile">
                            <button class="edit-btn">Edit</button>
                        </div>
                       <h2><%= name %></h2>

<div class="info-row">
    <span>Email:</span>
    <span><%= email %></span>
</div>

<div class="info-row">
    <span>Phone:</span>
    <span><%= phone %></span>
</div>

<div class="info-row">
    <span>Location:</span>
    <span><%= address %></span>
</div>
                    </div>
                </div>
            </section>

            <!-- My Crops Page -->
           <div class="table-container">
    <table class="crops-table">
        <thead>
            <tr>
                <th>Crop</th>
                <th>Acres</th>
                <th>Status</th>
                <th>Harvest Date</th>
                <th>Actions</th>
            </tr>
        </thead>

        <tbody>
        <%
        if(rsCrop != null){
            boolean hasData = false;

            while(rsCrop.next()){
                hasData = true;
        %>
            <tr>
                <td>🌾 <%= rsCrop.getString("CropName") %></td>
                <td><%= rsCrop.getInt("Price") %></td>
                <td>
                    <span class="status active">
                        <%= rsCrop.getString("Status") %>
                    </span>
                </td>
                <td><%= rsCrop.getString("HarvestDate") %></td>
                <td>
                    <button class="action-btn edit">Edit</button>
                    <button class="action-btn delete">Delete</button>
                </td>
            </tr>
        <%
            }

            if(!hasData){
        %>
            <tr>
                <td colspan="5" style="text-align:center; color:red;">
                    No crops found
                </td>
            </tr>
        <%
            }
        }
        %>
        </tbody>

    </table>
</div>

            <!-- Add Crop Page -->
            <section id="addcrop" class="content-page">
                <div class="page-header">
                    <h1>Add New Crop</h1>
                    <p>Add your crop details to start selling</p>
                </div>
                <form class="add-crop-form">
                    <div class="form-grid">
                        <div class="input-group">
                            <label>Crop Name</label>
                            <input type="text" placeholder="e.g., Wheat, Tomatoes">
                        </div>
                        <div class="input-group">
                            <label>Acres</label>
                            <input type="number" placeholder="0">
                        </div>
                        <div class="input-group">
                            <label>Expected Yield (tons)</label>
                            <input type="number" step="0.1" placeholder="0.0">
                        </div>
                        <div class="input-group">
                            <label>Harvest Date</label>
                            <input type="date">
                        </div>
                        <div class="input-group full">
                            <label>Description</label>
                            <textarea placeholder="Describe your crop..."></textarea>
                        </div>
                    </div>
                    <button type="submit" class="submit-btn">Add Crop</button>
                </form>
            </section>

            <!-- Contract Requests Page -->
            <section id="contracts" class="content-page">
                <div class="page-header">
                    <h1>Contract Requests</h1>
                    <p>Review buyer contract offers</p>
                </div>
                <div class="requests-grid">
                    <div class="request-card">
                        <div class="request-header">
                            <h3>ABC Agri Corp</h3>
                            <span class="status pending">Pending</span>
                        </div>
                        <div class="request-details">
                            <p><strong>Crop:</strong> Wheat (5 acres)</p>
                            <p><strong>Price:</strong> $250/ton</p>
                            <p><strong>Total:</strong> $2,500</p>
                        </div>
                        <div class="request-actions">
                            <button class="action-btn accept">Accept</button>
                            <button class="action-btn reject">Reject</button>
                        </div>
                    </div>
                    <!-- More request cards can be added -->
                </div>
            </section>

            <!-- Payments Page -->
            <section id="payments" class="content-page">
                <div class="page-header">
                    <h1>Payments</h1>
                    <p>Track your earnings and payments</p>
                </div>
                <div class="payment-stats">
                    <div class="payment-card total">
                        <h3>$4,250</h3>
                        <p>Total Earnings</p>
                    </div>
                    <div class="payment-card pending">
                        <h3>$2,050</h3>
                        <p>Pending Payments</p>
                    </div>
                    <div class="payment-card paid">
                        <h3>$2,200</h3>
                        <p>Paid</p>
                    </div>
                </div>
                <div class="table-container">
                    <table class="payments-table">
                        <thead>
                            <tr>
                                <th>Buyer</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>ABC Agri Corp</td>
                                <td>$1,200</td>
                                <td><span class="status paid">Paid</span></td>
                                <td>Dec 1</td>
                            </tr>
                            <tr>
                                <td>XYZ Buyers</td>
                                <td>$850</td>
                                <td><span class="status pending">Pending</span></td>
                                <td>Dec 10</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- Find Buyers Page -->
            <section id="buyers" class="content-page">
                <div class="page-header">
                    <h1>Find Buyers</h1>
                    <p>Discover buyers looking for your crops</p>
                </div>
                <div class="buyers-grid">
                    <div class="buyer-card">
                        <div class="buyer-avatar">AB</div>
                        <div class="buyer-info">
                            <h3>ABC Agri Corp</h3>
                            <p>Looking for: Wheat, Corn | Budget: $300k</p>
                        </div>
                        <button class="contact-btn">Contact</button>
                    </div>
                    <div class="buyer-card">
                        <div class="buyer-avatar">XY</div>
                        <div class="buyer-info">
                            <h3>XYZ Food Inc</h3>
                            <p>Looking for: Tomatoes, Peppers | Budget: $150k</p>
                        </div>
                        <button class="contact-btn">Contact</button>
                    </div>
                </div>
            </section>
        </main>
    </div>

    <script>
        // Sidebar navigation functionality
        document.querySelectorAll('.nav-item').forEach(item => {
            item.addEventListener('click', function(e) {
                if (this.classList.contains('logout')) {
                    if (confirm('Are you sure you want to logout?')) {
                        window.location.href = 'index.html'; // Redirect to login
                    }
                    return;
                }

                // Remove active class from all nav items and content pages
                document.querySelectorAll('.nav-item').forEach(nav => nav.classList.remove('active'));
                document.querySelectorAll('.content-page').forEach(page => page.classList.remove('active'));

                // Add active class to clicked item and corresponding page
                this.classList.add('active');
                const pageId = this.getAttribute('data-page');
                document.getElementById(pageId).classList.add('active');
            });
        });

        // Search functionality (placeholder)
        document.querySelector('.nav-search input').addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        document.querySelector('.nav-search input').addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });
    </script>
</body>
</html>