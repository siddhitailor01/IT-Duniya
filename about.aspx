<%@ Page Title="About IT Duniya | Best BCA, BSc-IT & Programming Learning Hub in Bhilwara" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="about.aspx.cs" Inherits="about" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Learn about IT Duniya, Bhilwara's leading IT education portal. We provide easy-to-understand Hinglish tutorials, BCA/BSc-IT notes, and MERN stack guidance for students." />
    <meta name="keywords" content="About IT Duniya, IT Education Bhilwara, BCA Notes, BSc-IT Projects, MERN Stack Hinglish, Programming Solutions, Learn Coding Bhilwara" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="About IT Duniya - Empowering Next-Gen Developers" />
    <meta property="og:description" content="Bridging the gap between complex technology and students with professional Hinglish modules." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.itduniya.in/about.aspx" />

    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700;800&family=Dancing+Script:wght@600&display=swap" rel="stylesheet">
    <style>
        /* --- Premium Startup Variables --- */
        :root {
            --navy-deep: #003a4d;
            --cyan-accent: #00c4cc;
            --soft-gray: #f8f9fa;
            --text-muted: #64748b;
        }

        body { font-family: 'Inter', sans-serif; background-color: #ffffff; }

        /* --- Simple Header (Image 1 Style) --- */
        .page-header {
            padding: 80px 0;
            background: var(--soft-gray);
            border-bottom: 1px solid #eee;
        }
        .breadcrumb-text { font-size: 11px; font-weight: 800; text-transform: uppercase; color: var(--cyan-accent); letter-spacing: 2px; }
        .page-header h1 { color: var(--navy-deep); font-weight: 800; font-size: 3rem; margin-top: 10px; }

        /* --- Intro Section with Image --- */
        .intro-section { padding: 120px 0; }
        .accent-title { color: var(--cyan-accent); font-weight: 800; font-size: 11px; text-transform: uppercase; letter-spacing: 2px; display: block; margin-bottom: 15px; }
        .intro-section h2 { color: var(--navy-deep); font-weight: 800; font-size: 2.2rem; margin-bottom: 30px; }
        .intro-text { color: var(--text-muted); line-height: 1.8; font-size: 15px; margin-bottom: 40px; }

        /* Signature Style */
        .signature-box { margin-top: 40px; display: flex; align-items: center; gap: 20px; }
        .signature-font { font-family: 'Dancing Script', cursive; font-size: 32px; color: var(--navy-deep); }
        .founder-sign-name { font-weight: 800; font-size: 14px; color: var(--navy-deep); margin-bottom: 0; }
        .founder-sign-title { font-size: 12px; color: var(--text-muted); }

        /* --- Stats/Counter Section (Matching Image 3) --- */
        .stats-bar { background: #ffffff; padding: 60px 0; border-top: 1px solid #eee; border-bottom: 1px solid #eee; }
        .stat-item { text-align: left; display: flex; align-items: center; gap: 20px; }
        .stat-icon { font-size: 2.5rem; color: var(--navy-deep); }
        .stat-info h3 { font-weight: 800; color: var(--navy-deep); margin-bottom: 0; font-size: 28px; }
        .stat-info span { color: var(--cyan-accent); font-weight: 800; }
        .stat-label { font-size: 11px; font-weight: 800; text-transform: uppercase; color: var(--navy-deep); letter-spacing: 1px; }

        /* --- Vision/Mission Boxes --- */
        .vision-section { padding: 120px 0; background-color: var(--soft-gray); }
        .card-minimal {
            background: white; padding: 50px 40px; border-radius: 0; border: none;
            box-shadow: 0 10px 30px rgba(0,0,0,0.03); height: 100%; transition: 0.4s;
        }
        .card-minimal:hover { transform: translateY(-10px); box-shadow: 0 20px 40px rgba(0,0,0,0.06); }
        .card-minimal i { color: var(--cyan-accent); font-size: 2rem; margin-bottom: 25px; display: block; }
        .card-minimal h4 { font-weight: 800; color: var(--navy-deep); font-size: 1.1rem; text-transform: uppercase; margin-bottom: 20px; }

        /* --- Big Family/Team Section --- */
        .founder-profile-section { padding: 120px 0; }
        .profile-img-container img { width: 100px; height:100px; filter: grayscale(100%); transition: 0.5s; border-radius:50%; }
        .profile-img-container:hover img { filter: grayscale(0%); }
        .profile-name { font-weight: 800; color: var(--navy-deep); font-size: 1.1rem; margin-top: 25px; margin-bottom: 5px; text-transform: uppercase; }
        .profile-title { font-size: 11px; font-weight: 700; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 1px; }

        /* Spacing Utilities */
        .mt-100 { margin-top: 100px; }
        .pe-100 { padding-right: 100px; }

        /* --- Premium About Header (Image 8 Style) --- */
        .premium-page-header {
            background: linear-gradient(rgba(0, 58, 77, 0.6), rgba(0, 58, 77, 0.6)), 
                        url('assets/images/aboutus.jpg'); 
            background-size: cover;
            background-position: center;
            padding: 50px 0;
            color: #ffffff;
            border-bottom: 4px solid var(--cyan-accent);
            position: relative;
        }

        .header-sub-tag {
            font-size: 11px;
            font-weight: 800;
            color: var(--cyan-accent);
            text-transform: uppercase;
            letter-spacing: 2px;
            display: block;
            margin-bottom: 10px;
        }

        .header-main-title {
            font-size: 3rem;
            font-weight: 800;
            margin-bottom: 15px;
            color: #ffffff;
        }

        .header-main-title span { color: var(--cyan-accent); }

        .header-desc {
            font-size: 14px;
            color: rgba(255,255,255,0.8);
            max-width: 500px;
            line-height: 1.6;
        }

        .breadcrumb-nav {
            font-size: 13px;
            font-weight: 700;
            letter-spacing: 0.5px;
        }

        .breadcrumb-nav a {
            color: #ffffff;
            text-decoration: none;
            transition: 0.3s;
        }

        .breadcrumb-nav a:hover { color: var(--cyan-accent); }

        .breadcrumb-nav .sep {
            margin: 0 12px;
            color: var(--cyan-accent);
            font-weight: 800;
        }

        .breadcrumb-nav .active-page { color: var(--cyan-accent); }

        @media (max-width: 768px) {
            .premium-page-header { text-align: center; padding: 60px 0; }
            .breadcrumb-nav { margin-top: 25px; justify-content: center; display: flex; }
            .header-main-title { font-size: 2.2rem; }
        }
    </style>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <section class="premium-page-header">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-8" data-aos="fade-right">
                <span class="header-sub-tag">Company Insight</span>
                <h1 class="header-main-title">ABOUT <span>US</span></h1>
                <p class="header-desc">Empowering next-gen developers in Bhilwara with professional IT skills.</p>
            </div>
            
            <div class="col-md-4 text-md-end" data-aos="fade-left">
                <nav class="breadcrumb-nav">
                    <a href="index.aspx">Home</a>
                    <span class="sep">/</span>
                    <span class="active-page">About Us</span>
                </nav>
            </div>
        </div>
    </div>
</section>

    <section class="intro-section">
        <div class="container">
            <div class="row align-items-center g-5">
                <div class="col-lg-7 pe-lg-5" data-aos="fade-right">
                    <span class="accent-title">About Us</span>
                    <h2>OUR VALUES AND GOALS</h2>
                    <p class="intro-text">
                        itduniya.in was established with a singular vision: to bridge the gap between complex technology and students. We understand that learning to code can be intimidating, which is why we break down the most difficult concepts into easy-to-understand stories in Hinglish.
                    </p>
                    <p class="intro-text">
                        Whether it's mastering the MERN Stack, debugging .NET applications, or understanding the logic of C++, we empower next-gen developers in Bhilwara and beyond to build their dreams with confidence.
                    </p>
                    
                    <div class="signature-box">
                        <div class="signature-font">IT Duniya</div>
                        <div>
                            <p class="founder-sign-name">IT Duniya</p>
                            <p class="founder-sign-title">Founder & CEO</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5" data-aos="fade-left">
                    <img src="assets/images/aboutpage.jpg" class="img-fluid" alt="Startup Excellence" />
                </div>
            </div>
        </div>
    </section>

    <section class="vision-section">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-4" data-aos="fade-up">
                    <div class="card-minimal">
                        <i class="fas fa-eye"></i>
                        <h4>Our Vision</h4>
                        <p class="text-muted small">Creating a digital world where technical education is accessible to every student, breaking the language barrier through professional Hinglish modules.</p>
                    </div>
                </div>
                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="100">
                    <div class="card-minimal border-top border-info border-4">
                        <i class="fas fa-rocket"></i>
                        <h4>Our Mission</h4>
                        <p class="text-muted small">To provide high-quality tutorials, production-ready error solutions, and practical project files to help master modern technology stacks.</p>
                    </div>
                </div>
                <div class="col-lg-4" data-aos="fade-up" data-aos-delay="200">
                    <div class="card-minimal">
                        <i class="fas fa-user-graduate"></i>
                        <h4>Target Audience</h4>
                        <p class="text-muted small">BCA, BSc-IT, and Engineering students who are looking for clear logic and industry-level guidance in a crowded coding world.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="founder-profile-section">
        <div class="container text-center">
            <span class="accent-title">The Big Family</span>
            <h2 class="fw-bold mt-2" style="color:var(--navy-deep);">MEET THE MIND BEHIND IT DUNIYA</h2>
            
            <div class="row justify-content-center mt-5 pt-4">
                <div class="col-lg-4 col-md-6" data-aos="zoom-in">
                    <div class="profile-img-container">
                    <img src="assets/images/founder.png" class="img-fluid" alt="IT Duniya Founder" />
                    </div>
                    <div class="profile-name">IT Duniya</div>
                    <div class="profile-title">Founder & Full-Stack Developer</div>
                    <p class="text-muted small mt-3 px-3">
                        A developer who loves breaking down complex logic into stories. Expert in MERN, .NET, and C++. Based in Bhilwara, Rajasthan.
                    </p>
                    <div class="d-flex justify-content-center gap-3 mt-3">
                        <a href="#" class="text-muted"><i class="fab fa-youtube"></i></a>
                        <a href="#" class="text-muted"><i class="fab fa-instagram"></i></a>
                        <a href="#" class="text-muted"><i class="fab fa-linkedin-in"></i></a>
                    </div>
                </div>
            </div>

            <div class="mt-5 pt-4" data-aos="fade-up">
                <p class="text-muted mx-auto" style="max-width: 800px; line-height: 2;">
                    When I'm not writing code or solving errors, I'm usually recording vlogs for my community or hanging out with my <strong>Labrador</strong>. Let's make the world of IT a little less intimidating and a lot more fun together!
                </p>
                <a href="contact.aspx" class="btn btn-outline-info rounded-pill px-5 mt-4 fw-bold">WORK WITH US</a>
            </div>
        </div>
    </section>
</asp:Content>