<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Dashboard - CropHub</title>
    <link rel="stylesheet" href="css/b_3_BuyerProfile.css">
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
            <input type="text" placeholder="Search crops, farmers...">
        </div>
        <div class="nav-actions">
            <div class="notification">
                <i class="fas fa-bell"></i>
                <span class="badge">2</span>
            </div>
            <div class="user-profile">
                <img src="https://via.placeholder.com/40x40/667eea/ffffff?text=AB" alt="User">
                <span>ABC Agri Corp</span>
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
                    <li class="nav-item" data-page="browse">
                        <i class="fas fa-seedling"></i>
                        <span>Browse Crops</span>
                    </li>
                    <li class="nav-item" data-page="contracts">
                        <i class="fas fa-file-contract"></i>
                        <span>My Contracts</span>
                    </li>
                    <li class="nav-item" data-page="payments">
                        <i class="fas fa-credit-card"></i>
                        <span>Payments</span>
                    </li>
                    <li class="nav-item" data-page="buyers">
                        <i class="fas fa-users"></i>
                        <span>Find Farmers</span>
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
                    <p>Welcome back, ABC Agri Corp! Here's your buying activity.</p>
                </div>
                
                <div class="stats-grid">
                    <div class="stat-card">
                        <div class="stat-icon green"><i class="fas fa-shopping-cart"></i></div>
                        <div class="stat-info">
                            <h3>8</h3>
                            <p>Active Contracts</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon blue"><i class="fas fa-seedling"></i></div>
                        <div class="stat-info">
                            <h3>45</h3>
                            <p>Crops Browsed</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon orange"><i class="fas fa-credit-card"></i></div>
                        <div class="stat-info">
                            <h3>$28,500</h3>
                            <p>Total Spent</p>
                        </div>
                    </div>
                    <div class="stat-card">
                        <div class="stat-icon purple"><i class="fas fa-handshake"></i></div>
                        <div class="stat-info">
                            <h3>12</h3>
                            <p>Farmers Contacted</p>
                        </div>
                    </div>
                </div>

                <div class="cards-grid">
                    <div class="card">
                        <h3>Recent Contracts</h3>
                        <div class="contract-list">
                            <div class="contract-item">
                                <span class="crop-icon">🌾</span>
                                <div>
                                    <h4>Wheat - John Doe Farm</h4>
                                    <p>5 tons @ $250/ton = $1,250</p>
                                </div>
                                <span class="status active">Active</span>
                            </div>
                            <div class="contract-item">
                                <span class="crop-icon">🍅</span>
                                <div>
                                    <h4>Tomatoes - Green Valley</h4>
                                    <p>3 tons @ $300/ton = $900</p>
                                </div>
                                <span class="status pending">Pending</span>
                            </div>
                        </div>
                    </div>
                    <div class="card">
                        <h3>Upcoming Deliveries</h3>
                        <ul>
                            <li><strong>John Doe:</strong> Wheat - Dec 15</li>
                            <li><strong>Green Valley:</strong> Tomatoes - Dec 20</li>
                        </ul>
                    </div>
                </div>
            </section>

            <!-- Profile Page -->
            <section id="profile" class="content-page">
                <div class="page-header">
                    <h1>Company Profile</h1>
                    <p>Manage your buyer account information</p>
                </div>
                <div class="profile-content">
                    <div class="profile-card">
                        <div class="profile-avatar">
                            <img src="https://via.placeholder.com/120x120/667eea/ffffff?text=AB" alt="Profile">
                            <button class="edit-btn">Edit</button>
                        </div>
                        <h2>ABC Agri Corp</h2>
                        <p class="buyer-type">Certified Food Processor</p>
                        <div class="profile-info">
                            <div class="info-row">
                                <span>Contact:</span>
                                <span>sarah@abcagri.com</span>
                            </div>
                            <div class="info-row">
                                <span>Phone:</span>
                                <span>+1 (555) 987-6543</span>
                            </div>
                            <div class="info-row">
                                <span>Location:</span>
                                <span>New York, USA</span>
                            </div>
                            <div class="info-row">
                                <span>Annual Purchase:</span>
                                <span>$2.5M</span>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Browse Crops Page -->
            <section id="browse" class="content-page">
                <div class="page-header">
                    <h1>Browse Crops</h1>
                    <p>Discover available crops from farmers</p>
                </div>
                <div class="filters">
                    <select>
                        <option>Crop Type</option>
                        <option>Wheat</option>
                        <option>Tomatoes</option>
                        <option>Corn</option>
                    </select>
                    <select>
                        <option>Location</option>
                        <option>California</option>
                        <option>Texas</option>
                        <option>Florida</option>
                    </select>
                    <select>
                        <option>Status</option>
                        <option>Ready</option>
                        <option>Growing</option>
                    </select>
                </div>
                <div class="crops-grid">
                    <div class="crop-card">
                        <div class="crop-image">🌾</div>
                        <div class="crop-info">
                            <h3>Wheat</h3>
                            <p>John Doe Farm • California</p>
                            <div class="crop-details">
                                <span>5 acres</span>
                                <span>Ready Dec 15</span>
                            </div>
                        </div>
                        <div class="crop-actions">
                            <button class="request-btn">Request Contract</button>
                            <span class="price">$250/ton</span>
                        </div>
                    </div>
                    <div class="crop-card">
                        <div class="crop-image">🍅</div>
                        <div class="crop-info">
                            <h3>Tomatoes</h3>
                            <p>Green Valley • Florida</p>
                            <div class="crop-details">
                                <span>3 acres</span>
                                <span>Ready Jan 20</span>
                            </div>
                        </div>
                        <div class="crop-actions">
                            <button class="request-btn">Request Contract</button>
                            <span class="price">$300/ton</span>
                        </div>
                    </div>
                </div>
            </section>

            <!-- My Contracts Page -->
            <section id="contracts" class="content-page">
                <div class="page-header">
                    <h1>My Contracts</h1>
                    <p>Manage your active contracts with farmers</p>
                </div>
                <div class="table-container">
                    <table class="contracts-table">
                        <thead>
                            <tr>
                                <th>Crop</th>
                                <th>Farmer</th>
                                <th>Quantity</th>
                                <th>Price</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>🌾 Wheat</td>
                                <td>John Doe</td>
                                <td>5 tons</td>
                                <td>$1,250</td>
                                <td><span class="status active">Active</span></td>
                                <td>
                                    <button class="action-btn view">View</button>
                                    <button class="action-btn pay">Pay</button>
                                </td>
                            </tr>
                            <tr>
                                <td>🍅 Tomatoes</td>
                                <td>Green Valley</td>
                                <td>3 tons</td>
                                <td>$900</td>
                                <td><span class="status pending">Pending</span></td>
                                <td>
                                    <button class="action-btn view">View</button>
                                    <button class="action-btn cancel">Cancel</button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- Payments Page -->
            <section id="payments" class="content-page">
                <div class="page-header">
                    <h1>Payments</h1>
                    <p>Track your payments to farmers</p>
                </div>
                <div class="payment-stats">
                    <div class="payment-card total">
                        <h3>$28,500</h3>
                        <p>Total Spent</p>
                    </div>
                    <div class="payment-card pending">
                        <h3>$2,150</h3>
                        <p>Pending Payments</p>
                    </div>
                    <div class="payment-card paid">
                        <h3>$26,350</h3>
                        <p>Paid</p>
                    </div>
                </div>
                <div class="table-container">
                    <table class="payments-table">
                        <thead>
                            <tr>
                                <th>Farmer</th>
                                <th>Amount</th>
                                <th>Status</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>John Doe</td>
                                <td>$1,250</td>
                                <td><span class="status paid">Paid</span></td>
                                <td>Dec 1</td>
                            </tr>
                            <tr>
                                <td>Green Valley</td>
                                <td>$900</td>
                                <td><span class="status pending">Pending</span></td>
                                <td>Dec 10</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </section>

            <!-- Find Farmers Page -->
            <section id="buyers" class="content-page">
                <div class="page-header">
                    <h1>Find Farmers</h1>
                    <p>Discover farmers matching your requirements</p>
                </div>
                <div class="farmers-grid">
                    <div class="farmer-card">
                        <div class="farmer-avatar">JD</div>
                        <div class="farmer-info">
                            <h3>John Doe</h3>
                            <p>California • 25 acres • Organic Certified</p>
                            <div class="farmer-specialty">
                                <span>🌾 Wheat</span>
                                <span>🌽 Corn</span>
                            </div>
                        </div>
                        <button class="contact-btn">View Crops</button>
                    </div>
                    <div class="farmer-card">
                        <div class="farmer-avatar">GV</div>
                        <div class="farmer-info">
                            <h3>Green Valley Farms</h3>
                            <p>Florida • 15 acres • Conventional</p>
                            <div class="farmer-specialty">
                                <span>🍅 Tomatoes</span>
                                <span>🌶️ Peppers</span>
                            </div>
                        </div>
                        <button class="contact-btn">View Crops</button>
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
                        window.location.href = 'index.html';
                    }
                    return;
                }

                document.querySelectorAll('.nav-item').forEach(nav => nav.classList.remove('active'));
                document.querySelectorAll('.content-page').forEach(page => page.classList.remove('active'));

                this.classList.add('active');
                const pageId = this.getAttribute('data-page');
                document.getElementById(pageId).classList.add('active');
            });
        });

        document.querySelector('.nav-search input').addEventListener('focus', function() {
            this.parentElement.classList.add('focused');
        });
        document.querySelector('.nav-search input').addEventListener('blur', function() {
            this.parentElement.classList.remove('focused');
        });
    </script>
</body>
</html>