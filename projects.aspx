<%@ Page Title="Industrial IT Projects & Case Studies with Source Code | IT Duniya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="projects.aspx.cs" Inherits="projects" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Explore a wide range of industrial-level IT projects at IT Duniya. Download source code and case studies for BCA, BSc-IT, and Engineering. Build your professional portfolio today." />
    <meta name="keywords" content="Industrial IT Projects, Source Code for Students, BCA Projects, BSc-IT Case Studies, MERN Stack Projects, .NET Projects, Portfolio Building, Coding Projects Bhilwara" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="IT Duniya Portfolio - Real-World Projects for Aspiring Developers" />
    <meta property="og:description" content="Boost your career with our industry-level projects. From beginner to advanced, find the perfect project for your tech stack." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.itduniya.in/projects.aspx" />
    <meta property="og:image" content="https://www.itduniya.in/assets/images/projects-share.jpg" />

    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="Industry-Ready IT Projects | IT Duniya" />
    <meta name="twitter:description" content="Download projects and master new technologies with real-world case studies." />

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d; /* Image Navy */
            --cyan-accent: #00c4cc; /* Image Cyan */
            --bg-gray: #f4f7f6;   /* Depth Gray */
            --text-muted: #64748b;
        }

        body { background-color: #ffffff; }

        /* --- Premium Header (Image 8 Style) --- */
        .project-header-section {
            background: linear-gradient(rgba(0, 58, 77, 0.65), rgba(0, 58, 77, 0.65)), 
                        url('assets/images/projects.jpg');
            background-size: cover; background-position: center;
            padding: 50px 0; color: #ffffff;
            border-bottom: 4px solid var(--cyan-accent); /* Cyan Accent Line */
        }
        .header-tag { font-size: 11px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 2.5px; display: block; margin-bottom: 10px; }
        .header-title { font-size: 3rem; font-weight: 800; color: #ffffff; margin-bottom: 15px; text-transform: uppercase; }
        .header-title span { color: var(--cyan-accent); }

        /* --- Breadcrumb Path --- */
        .breadcrumb-box { font-size: 13px; font-weight: 700; color: #ffffff; }
        .breadcrumb-box a { color: #ffffff; text-decoration: none; transition: 0.3s; }
        .breadcrumb-box a:hover { color: var(--cyan-accent); }
        .sep { margin: 0 10px; color: var(--cyan-accent); }

        /* --- Filter Section (Gray Depth) --- */
        .filter-bar {
            background-color: var(--bg-gray);
            padding: 30px 0;
            border-bottom: 1px solid #e2e8f0;
            margin-bottom: 60px;
        }
        .filter-btn-startup { 
            font-size: 11px; font-weight: 800; text-transform: uppercase; 
            letter-spacing: 1px; border-radius: 2px; padding: 12px 30px;
            margin-right: 10px; transition: 0.4s; display: inline-block;
            text-decoration: none;
        }
        .f-active { background-color: var(--navy-deep) !important; color: white !important; border: none; box-shadow: 0 10px 20px rgba(0,43,69,0.1); }
        .f-inactive { background-color: white; color: var(--navy-deep); border: 1px solid #e2e8f0; }
        .f-inactive:hover { border-color: var(--cyan-accent); color: var(--cyan-accent); }


        /* --- Desktop Filter Bar (Clean) --- */
.filter-bar .container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap; /* Taki screen choti hone par niche aa sakein */
    gap: 10px; /* Margin-right ki jagah gap use karein */
}

/* --- Mobile View Fix (Max-width: 768px) --- */
@media (max-width: 768px) {
    .filter-bar {
        padding: 20px 0; /* Vertical space kam karein */
        margin-bottom: 30px;
    }

    .filter-bar .container {
        gap: 8px; /* Mobile par gap aur kam */
    }

    .filter-btn-startup {
        font-size: 10px; /* Text thoda chota */
        padding: 10px 15px; /* Padding kam karein taaki screen par fit ho */
        margin-right: 0 !important; /* Purana margin hatayein */
        flex: 1 1 auto; /* Buttons ko barabar jagah lene dein */
        min-width: calc(50% - 10px); /* Ek line mein 2 buttons layein */
        text-align: center;
        white-space: nowrap; /* Text ko break hone se roke */
    }

    /* Header Title adjustment for mobile */
    .header-title {
        font-size: 2rem !important;
    }
}

/* Extra small devices (Chote mobiles) */
@media (max-width: 380px) {
    .filter-btn-startup {
        min-width: 100%; /* Ek line mein ek hi button */
    }
}

        /* --- Project Case-Study Cards --- */
        .case-study-card {
            background: #ffffff;
            border: 1px solid #edf2f7;
            transition: 0.5s cubic-bezier(0.165, 0.84, 0.44, 1);
            height: 100%;
            position: relative;
        }
        .case-study-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 30px 60px rgba(0,0,0,0.08);
        }
        .img-wrapper { overflow: hidden; position: relative; }
        .case-study-card img { transition: 0.8s; }
        .case-study-card:hover img { transform: scale(1.1); }

        .case-content { padding: 40px 30px; border-top: 4px solid var(--navy-deep); } /* Navy accent */
        .case-study-card:hover .case-content { border-top-color: var(--cyan-accent); }

        .case-lvl-tag { font-size: 10px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 2px; display: block; margin-bottom: 15px; }
        .case-title { font-size: 1.25rem; font-weight: 800; color: var(--navy-deep); margin-bottom: 15px; line-height: 1.3; }
        .case-tech { font-size: 13px; color: var(--text-muted); margin-bottom: 25px; display: block; }

        .btn-view-project {
            font-size: 11px; font-weight: 800; text-transform: uppercase;
            color: var(--navy-deep); text-decoration: none; border-bottom: 2px solid var(--cyan-accent);
            padding-bottom: 5px; transition: 0.3s;
        }
        .btn-view-project:hover { color: var(--cyan-accent); border-bottom-color: var(--navy-deep); }

        /* --- Empty State --- */
        .empty-projects-box {
            padding: 100px 0; text-align: center; background: var(--bg-gray);
            border: 1px dashed #cbd5e1; border-radius: 4px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="project-header-section">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8" data-aos="fade-right">
                    <span class="header-tag">Portfolio & Case Studies</span>
                    <h1 class="header-title">OUR <span>PROJECTS</span></h1>
                    <p class="opacity-75 small">Apni coding skills ko boost karein in industry-level real-world projects ke saath.</p>
                </div>
                <div class="col-md-4 text-md-end" data-aos="fade-left">
                    <nav class="breadcrumb-box">
                        <a href="index.aspx">Home</a>
                        <span class="sep">/</span>
                        <span style="color:var(--cyan-accent)">Portfolio</span>
                    </nav>
                </div>
            </div>
        </div>
    </section>

    <div class="filter-bar">
        <div class="container text-center">
            <% 
                string currentLvl = Request.QueryString["lvl"] ?? "All"; 
            %>
            <a href="projects.aspx" class="filter-btn-startup <%= currentLvl == "All" ? "f-active" : "f-inactive" %>">All Work</a>
            <a href="projects.aspx?lvl=Beginner" class="filter-btn-startup <%= currentLvl == "Beginner" ? "f-active" : "f-inactive" %>">Beginner</a>
            <a href="projects.aspx?lvl=Intermediate" class="filter-btn-startup <%= currentLvl == "Intermediate" ? "f-active" : "f-inactive" %>">Intermediate</a>
            <a href="projects.aspx?lvl=Advanced" class="filter-btn-startup <%= currentLvl == "Advanced" ? "f-active" : "f-inactive" %>">Advanced</a>
        </div>
    </div>

    <div class="container mb-5 pb-5">
        <div class="row g-5">
            <asp:Repeater ID="rptAllProjects" runat="server">
                <ItemTemplate>
                    <div class="col-md-6 col-lg-4" data-aos="fade-up">
                        <div class="case-study-card">
                            <div class="img-wrapper">
                                <img src='/admin/img/projects/<%# Eval("Thumbnail") %>' class="w-100" alt='<%# Eval("Title") %> Industrial Project' style="height:250px; object-fit:cover;">
                            </div>
                            <div class="case-content">
                                <span class="case-lvl-tag"><%# Eval("Level") %></span>
                                <h2 class="case-title" style="font-size: 1.25rem;"><%# Eval("Title") %></h2>
                                <span class="case-tech"><i class="fas fa-layer-group me-2"></i>Stack: <%# Eval("TechStack") %></span>
                                
                                <div class="d-flex justify-content-between align-items-center mt-4">
                                    <a href='projectdetails.aspx?id=<%# Eval("ProjectID") %>' class="btn-view-project" title='View details for <%# Eval("Title") %>'>
                                        View Case Study <i class="fas fa-chevron-right ms-2" style="font-size:9px;"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
                <FooterTemplate>
                    <asp:PlaceHolder ID="phEmpty" runat="server" Visible='<%# rptAllProjects.Items.Count == 0 %>'>
                        <div class="col-12">
                            <div class="empty-projects-box">
                                <i class="fas fa-folder-open fa-3x mb-3 opacity-25"></i>
                                <h4 class="fw-bold text-muted">No Projects Found</h4>
                                <p class="text-muted small">Is category mein abhi koi project upload nahi kiya gaya hai.</p>
                                <a href="projects.aspx" class="text-info fw-bold text-decoration-none small">BROWSE ALL PROJECTS →</a>
                            </div>
                        </div>
                    </asp:PlaceHolder>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</asp:Content>