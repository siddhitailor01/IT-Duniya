<%@ Page Title="Project Details - IT Duniya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="projectdetails.aspx.cs" Inherits="projectdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Detailed industrial case study and project architecture. Explore the tech stack, logic, and implementation details of our latest IT projects at IT Duniya." />
    <meta name="keywords" content="Industrial Project Case Study, Source Code Logic, Software Architecture, BCA Final Year Project, BSc-IT Projects, MERN Stack Case Study, IT Duniya Portfolio" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="Industrial IT Project Case Study | IT Duniya" />
    <meta property="og:description" content="Explore the full development lifecycle and tech-stack of this professional project." />
    <meta property="og:type" content="article" />
    <meta property="og:url" content='<%= Request.Url.AbsoluteUri %>' />
    <meta property="og:site_name" content="IT Duniya" />

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        /* Aapka existing CSS yahan rahega... */
        :root {
            --navy-deep: #003a4d;
            --cyan-accent: #00c4cc;
            --bg-gray: #f4f7f6;
            --text-muted: #64748b;
        }

        body { background-color: var(--bg-gray); }

        .project-detail-header {
            background: linear-gradient(rgba(0, 58, 77, 0.65), rgba(0, 58, 77, 0.65)), 
                        url('https://images.unsplash.com/photo-1517245386807-bb43f82c33c4?auto=format&fit=crop&w=1350&q=80');
            background-size: cover; background-position: center;
            padding: 50px 0 50px; color: #ffffff;
            border-bottom: 4px solid var(--cyan-accent);
        }
        .header-tag { font-size: 11px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 2.5px; display: block; margin-bottom: 10px; }
        .header-title { font-size: 2.8rem; font-weight: 800; margin-bottom: 10px; text-transform: uppercase; }
        
        .breadcrumb-box { font-size: 13px; font-weight: 700; }
        .breadcrumb-box a { color: #ffffff; text-decoration: none; transition: 0.3s; }
        .breadcrumb-box a:hover { color: var(--cyan-accent); }
        .sep { margin: 0 10px; color: var(--cyan-accent); }

        .main-case-wrapper {
            margin-top: -60px;
            position: relative; z-index: 10;
        }

        .project-content-card {
            background: #ffffff; padding: 50px; border-radius: 4px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.05);
            border-top: 5px solid var(--navy-deep);
        }
        .project-img-modern { 
            width: 100%; border-radius: 4px; 
            box-shadow: 0 15px 35px rgba(0,0,0,0.08); 
            margin-bottom: 40px; border: 1px solid #eee;
        }
        
        .section-heading {
            font-size: 11px; font-weight: 800; color: var(--navy-deep);
            text-transform: uppercase; letter-spacing: 2px;
            margin-bottom: 25px; border-left: 3px solid var(--cyan-accent);
            padding-left: 15px; display: block;
        }

        .project-desc { font-size: 1.05rem; line-height: 1.8; color: #334155; margin-bottom: 40px; }

        .info-card-premium {
            background: #ffffff; padding: 35px; border-radius: 4px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
            border: 1px solid #edf2f7;
        }
        .info-row {
            display: flex; justify-content: space-between; align-items: flex-start;
            padding: 15px 0; border-bottom: 1px dotted #cbd5e1;
        }
        .info-row:last-child { border: none; }
        .info-label { font-weight: 800; font-size: 12px; color: var(--navy-deep); text-transform: uppercase; }
        .info-value { font-size: 13px; color: var(--text-muted); text-align: right; }

        .tech-badge-startup {
            background: var(--bg-gray); color: var(--navy-deep);
            font-size: 10px; font-weight: 800; padding: 5px 12px;
            border-radius: 2px; border: 1px solid #e2e8f0;
            display: inline-block; margin: 2px;
        }

        .consult-dark-box {
            background: var(--navy-deep); color: white; padding: 40px 30px;
            text-align: center; margin-top: 30px;
        }

        .btn-back-startup {
            font-size: 11px; font-weight: 800; text-transform: uppercase;
            color: var(--navy-deep); text-decoration: none; border-bottom: 2px solid var(--cyan-accent);
            padding-bottom: 4px; transition: 0.3s;
        }
        .btn-back-startup:hover { color: var(--cyan-accent); border-bottom-color: var(--navy-deep); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="project-detail-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8" data-aos="fade-right">
                    <span class="header-tag">Project Case Study</span>
                    <h1 class="header-title"><asp:Literal ID="litTitle" runat="server"></asp:Literal></h1>
                </div>
                <div class="col-md-4 text-md-end" data-aos="fade-left">
                    <nav class="breadcrumb-box">
                        <a href="index.aspx">Home</a>
                        <span class="sep">/</span>
                        <a href="projects.aspx">Portfolio</a>
                        <span class="sep">/</span>
                        <span style="color:var(--cyan-accent)">Details</span>
                    </nav>
                </div>
            </div>
        </div>
    </section>

    <div class="container main-case-wrapper">
        <div class="row g-lg-5">
            <div class="col-lg-8" data-aos="fade-up">
                <div class="project-content-card mt-5 mb-5">
                    <asp:Image ID="imgProject" runat="server" CssClass="project-img-modern" alt="Project Screenshot" />
                    
                    <span class="section-heading">Executive Summary</span>
                    <div class="project-desc">
                        <asp:Literal ID="litDesc" runat="server"></asp:Literal>
                    </div>

                    <div class="p-5 border-start border-4" style="border-color:var(--cyan-accent) !important; background:var(--bg-gray);">
                        <h5 class="fw-bold mb-3" style="color:var(--navy-deep);"><i class="fas fa-lightbulb me-2 text-info"></i> Learning Objectives</h5>
                        <p class="text-muted mb-0" style="font-size:14px; line-height:1.7;">
                            By studying this architecture, you will practically implement core logic for 
                            <strong><asp:Literal ID="litTechList" runat="server"></asp:Literal></strong>, bridging the gap between theory and industry-grade development.
                        </p>
                    </div>

                    <div class="mt-5">
                        <a href="projects.aspx" class="btn-back-startup">
                            <i class="fas fa-arrow-left me-2"></i> Back to All Projects
                        </a>
                    </div>
                </div>
            </div>

            <div class="col-lg-4 mt-5 mt-lg-0" data-aos="fade-left">
                <div class="info-card-premium shadow-sm mt-3">
                    <span class="section-heading">Key Specifications</span>
                    
                    <div class="info-row">
                        <span class="info-label">Difficulty Level</span>
                        <span class="info-value fw-bold text-info"><asp:Literal ID="litLevel" runat="server"></asp:Literal></span>
                    </div>

                    <div class="info-row">
                        <span class="info-label">Architecture</span>
                        <span class="info-value"><asp:Literal ID="litComplexity" runat="server"></asp:Literal></span>
                    </div>

                    <div class="info-row">
                        <span class="info-label">Technologies</span>
                        <div class="info-value">
                            <asp:Literal ID="litTechBadges" runat="server"></asp:Literal>
                        </div>
                    </div>

                    <div class="info-row">
                        <span class="info-label">Last Updated</span>
                        <span class="info-value">Dec 30, 2025</span>
                    </div>
                </div>

                <div class="consult-dark-box shadow-lg" data-aos="zoom-in">
                    <h6 class="text-white fw-bold mb-3 text-uppercase" style="letter-spacing:1px;">Need Assistance?</h6>
                    <p class="text-white-50" style="font-size:11px; line-height:1.8;">
                        If you're facing issues in understanding the source code logic or database connectivity, feel free to reach out.
                    </p>
                    <a href="Contact.aspx" class="btn btn-info btn-sm w-100 rounded-0 fw-bold mt-3 py-2" 
                       style="background:var(--cyan-accent); border:none; color:white;">CONTACT PARIKSHIT</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</asp:Content>