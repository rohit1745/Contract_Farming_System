// Functionality to manage page interactivity

// 1. Smooth Scrolling for navigation links
// (Handled partially by CSS 'scroll-behavior: smooth', but JS ensures better control across browsers)
document.querySelectorAll('nav a, .btn-white').forEach(anchor => {
    anchor.addEventListener('click', function(e) {
        // Only trigger smooth scroll for internal links
        if (this.getAttribute('href').startsWith('#')) {
            e.preventDefault();
            const targetId = this.getAttribute('href');
            const targetElement = document.querySelector(targetId);
            if (targetElement) {
                targetElement.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        }
    });
});

// 2. Dynamic 'Active' State in Navbar
// Highlights the current section in the nav menu while scrolling
const sections = document.querySelectorAll('section');
const navLinks = document.querySelectorAll('nav ul li a');

window.addEventListener('scroll', () => {
    let current = '';

    // Calculate which section is currently mostly visible
    sections.forEach(section => {
        const sectionTop = section.offsetTop;
        const sectionHeight = section.clientHeight;
        // Use an offset to account for the fixed header height
        if (pageYOffset >= (sectionTop - 100)) {
            current = section.getAttribute('id');
        }
    });

    // Remove active class from all and add to the current link
    navLinks.forEach(link => {
        link.classList.remove('active');
        if (link.getAttribute('href').includes(current)) {
            link.classList.add('active');
        }
    });
});

// 3. Inline Product Details Toggle
const farmerData = {
    1: { farmerId: 'FRM-101', farmerName: 'Ramesh Patil', contact: '+91 98234 56789', address: 'Plot 12, Green Valley, Nashik, Maharashtra' },
    2: { farmerId: 'FRM-102', farmerName: 'Suresh Kadam', contact: '+91 98765 43210', address: 'Village Road, Ahmednagar, Maharashtra' },
    3: { farmerId: 'FRM-103', farmerName: 'Ganesh Bhosale', contact: '+91 97654 32109', address: 'Farm No. 5, Sangli, Maharashtra' },
    4: { farmerId: 'FRM-104', farmerName: 'Mohan Jadhav', contact: '+91 98888 77766', address: 'H.No. 42, Solapur, Maharashtra' },
    5: { farmerId: 'FRM-105', farmerName: 'Dattatray More', contact: '+91 99999 88877', address: 'Sector 3, Pune, Maharashtra' },
    6: { farmerId: 'FRM-106', farmerName: 'Prakash Shinde', contact: '+91 91234 56789', address: 'Near River Bank, Kolhapur, Maharashtra' },
    7: { farmerId: 'FRM-107', farmerName: 'Vilas Deshmukh', contact: '+91 93456 78901', address: 'Khandala Ghat, Satara, Maharashtra' },
    8: { farmerId: 'FRM-108', farmerName: 'Anil Lokhande', contact: '+91 94567 89012', address: 'Main Road, Jalgaon, Maharashtra' },
    9: { farmerId: 'FRM-109', farmerName: 'Dinesh Gaikwad', contact: '+91 95678 90123', address: 'Old Market Area, Dhule, Maharashtra' },
    10: { farmerId: 'FRM-110', farmerName: 'Nitin Sawant', contact: '+91 96789 01234', address: 'Hill View, Ratnagiri, Maharashtra' },
    11: { farmerId: 'FRM-111', farmerName: 'Mahesh Yadav', contact: '+91 97890 12345', address: 'Rural Colony, Latur, Maharashtra' },
    12: { farmerId: 'FRM-112', farmerName: 'Sunil Chavan', contact: '+91 98901 23456', address: 'Sunrise Farms, Aurangabad, Maharashtra' }
};

const productGrid = document.querySelector('.product-grid');

document.querySelectorAll('.product-card .btn-green').forEach(button => {
    button.addEventListener('click', function() {
        const card = this.closest('.product-card');
        const id = card.getAttribute('data-id');
        const data = farmerData[id];

        if (!data) return;

        const isActive = card.classList.contains('active');

        // Close all cards first
        document.querySelectorAll('.product-card').forEach(c => c.classList.remove('active'));
        productGrid.classList.remove('has-active');

        if (!isActive) {
            // Populate details
            card.querySelector('.detail-farmer-id').innerText = data.farmerId;
            card.querySelector('.detail-farmer-name').innerText = data.farmerName;
            card.querySelector('.detail-contact').innerText = data.contact;
            card.querySelector('.detail-address').innerText = data.address;

            // Open this card and blur others
            card.classList.add('active');
            productGrid.classList.add('has-active');
        }
    });
});

// 4. Navbar Scroll Effect
const header = document.querySelector('header');
window.addEventListener('scroll', () => {
    if (window.scrollY > 50) {
        header.classList.add('scrolled');
    } else {
        header.classList.remove('scrolled');
    }
});

// 5. Scroll-to-Top Button
const scrollTopBtn = document.querySelector('.scroll-top');
window.addEventListener('scroll', () => {
    if (window.scrollY > 500) {
        scrollTopBtn.classList.add('visible');
    } else {
        scrollTopBtn.classList.remove('visible');
    }
});

scrollTopBtn.addEventListener('click', () => {
    window.scrollTo({ top: 0, behavior: 'smooth' });
});

// 6. Mobile Menu Toggle
const mobileMenuToggle = document.querySelector('.mobile-menu-toggle');
const mobileNav = document.querySelector('.mobile-nav');

mobileMenuToggle.addEventListener('click', () => {
    mobileNav.classList.toggle('active');
    const icon = mobileMenuToggle.querySelector('i');
    if (mobileNav.classList.contains('active')) {
        icon.classList.remove('fa-bars');
        icon.classList.add('fa-times');
    } else {
        icon.classList.remove('fa-times');
        icon.classList.add('fa-bars');
    }
});

// Close mobile nav on link click
document.querySelectorAll('.mobile-nav a').forEach(link => {
    link.addEventListener('click', () => {
        mobileNav.classList.remove('active');
        mobileMenuToggle.querySelector('i').classList.remove('fa-times');
        mobileMenuToggle.querySelector('i').classList.add('fa-bars');
    });
});

// 7. Add Product Badges Dynamically
const badges = ['Fresh', 'Organic', 'Fresh', 'Organic', 'Fresh', 'Organic', 'Fresh', 'Organic', 'Fresh', 'Fresh', 'Organic', 'Fresh'];
document.querySelectorAll('.product-card').forEach((card, index) => {
    const badgeText = badges[index] || 'Fresh';
    const badgeClass = badgeText === 'Organic' ? 'product-badge organic' : 'product-badge';
    const badge = document.createElement('span');
    badge.className = badgeClass;
    badge.innerText = badgeText;
    card.appendChild(badge);
});

// 8. Intersection Observer for Scroll Reveal Animations
const revealElements = document.querySelectorAll('.about-content, .stats-grid, .cards-container, .testimonial-grid, .cta-content, .product-grid');

const revealObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            const children = entry.target.children;
            Array.from(children).forEach((child, index) => {
                child.classList.add('reveal');
                setTimeout(() => {
                    child.classList.add('visible');
                }, index * 100);
            });
            observer.unobserve(entry.target);
        }
    });
}, { threshold: 0.1 });

revealElements.forEach(el => revealObserver.observe(el));

// Reveal for section titles
const titles = document.querySelectorAll('.main-title, .section-title');
const titleObserver = new IntersectionObserver((entries, observer) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            entry.target.classList.add('reveal');
            setTimeout(() => entry.target.classList.add('visible'), 100);
            observer.unobserve(entry.target);
        }
    });
}, { threshold: 0.5 });

titles.forEach(t => titleObserver.observe(t));

// 9. Counter Animation for Stats
const statNumbers = document.querySelectorAll('.stat-number');
let countersAnimated = false;

const statsSection = document.querySelector('.stats-section');
const statsObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting && !countersAnimated) {
            countersAnimated = true;
            statNumbers.forEach(num => {
                const target = parseInt(num.getAttribute('data-target'));
                const duration = 2000;
                const increment = target / (duration / 16);
                let current = 0;

                const updateCounter = () => {
                    current += increment;
                    if (current < target) {
                        num.innerText = Math.ceil(current).toLocaleString();
                        requestAnimationFrame(updateCounter);
                    } else {
                        num.innerText = target.toLocaleString() + '+';
                    }
                };
                updateCounter();
            });
        }
    });
}, { threshold: 0.5 });

if (statsSection) statsObserver.observe(statsSection);

// 10. About section specific reveals
const aboutImage = document.querySelector('.about-image');
const aboutText = document.querySelector('.about-text');
const aboutObserver = new IntersectionObserver((entries) => {
    entries.forEach(entry => {
        if (entry.isIntersecting) {
            if (aboutImage) {
                aboutImage.classList.add('reveal-left');
                setTimeout(() => aboutImage.classList.add('visible'), 100);
            }
            if (aboutText) {
                aboutText.classList.add('reveal-right');
                setTimeout(() => aboutText.classList.add('visible'), 300);
            }
            aboutObserver.unobserve(entry.target);
        }
    });
}, { threshold: 0.2 });

const aboutSection = document.querySelector('.about-section');
if (aboutSection) aboutObserver.observe(aboutSection);
