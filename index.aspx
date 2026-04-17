<%@ Page Title="IT Duniya | BCA, BSc-IT Notes, Programming Tutorials & Projects in Bhilwara" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="IT Duniya is Bhilwara's leading IT education portal. Get professional BCA, BSc-IT, and Engineering notes, MERN stack tutorials, industrial projects, and expert bug solutions." />
    <meta name="keywords" content="IT Duniya, BCA Notes Bhilwara, BSc-IT Tutorials, MERN Stack learning, Programming Projects, Solve coding errors, IT Education Rajasthan, .NET projects" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.itduniya.in/" />
    <meta property="og:title" content="IT Duniya - Powering Your Tech Journey" />
    <meta property="og:description" content="Bhilwara's premier IT hub for students. High-quality tutorials, industrial projects, and professional bug resolution." />
    <meta property="og:image" content="https://www.itduniya.in/assets/images/og-main.jpg" />

    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="IT Duniya | Learn, Build & Fix Coding Problems" />
    <meta name="twitter:description" content="Access BCA/BSc-IT resources and industry-level programming projects." />

    <script type="application/ld+json">
    {
      "@context": "https://schema.org",
      "@type": "EducationalOrganization",
      "name": "IT Duniya",
      "url": "https://www.itduniya.in",
      "address": {
        "@type": "PostalAddress",
        "addressLocality": "Bhilwara",
        "addressRegion": "Rajasthan",
        "addressCountry": "India"
      },
      "description": "Premier IT education hub providing notes, tutorials, and project solutions."
    }
    </script>

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css">
    
    <style>
        :root {
            --navy-deep: #003a4d;
            --cyan-accent: #00c4cc;
            --bg-gray: #f8fafc;
            --text-slate: #64748b;
        }

        body { background-color: #ffffff; color: var(--navy-deep); font-family: 'Inter', sans-serif; overflow-x: hidden; }

        /* --- Global Section Helpers --- */
        .section-padding { padding: 100px 0; }
        .bg-dark-section { background-color: var(--navy-deep); color: #ffffff; }
        .bg-light-section { background-color: var(--bg-gray); }

        .section-header { text-align: center; margin-bottom: 60px; }
        .section-header span { font-size: 11px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 3px; display: block; margin-bottom: 10px; }
        .section-header h2 { font-weight: 800; text-transform: uppercase; font-size: 2.2rem; }
        .bg-dark-section .section-header h2 { color: #ffffff; }

        /* --- Hero Banner (Dark) --- */
        .hero-banner {
            position: relative;
            background: linear-gradient(rgba(0, 58, 77, 0.5), rgba(0, 58, 77, 0.5)), 
                        url('assets/images/index.jpg');
            background-size: cover; background-position: center; background-attachment: fixed;
            padding: 100px 0; color: #ffffff; border-bottom: 5px solid var(--cyan-accent);
        }
        .hero-banner h1 { font-size: 4rem; font-weight: 800; line-height: 1.1; letter-spacing: -2px; }
        .hero-banner h1 span { color: var(--cyan-accent); }

        /* --- Categories (Light - Circles) --- */
        .cat-item { text-align: center; margin-bottom: 20px; }
        .cat-icon-circle {
            width: 100px; height: 100px; border-radius: 50%;
            background: #ffffff; border: 2px solid #edf2f7;
            display: flex; align-items: center; justify-content: center;
            margin: 0 auto; transition: 0.4s;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05); color: var(--navy-deep);
        }
        .cat-item:hover .cat-icon-circle { border-color: var(--cyan-accent); transform: translateY(-8px); background: var(--navy-deep); color: #fff; }
        .cat-name-label { display: block; margin-top: 15px; font-weight: 700; font-size: 12px; text-transform: uppercase; color: var(--navy-deep); letter-spacing: 1px; }

        /* --- Case Studies (Dark - Slider) --- */
        .case-slider-card {
            background: #ffffff; margin: 15px; border-radius: 4px; overflow: hidden;
            box-shadow: 0 15px 35px rgba(0,0,0,0.2); border-bottom: 4px solid var(--cyan-accent);
            transition: 0.3s; color: var(--navy-deep);
        }
        .case-slider-img { height: 220px; width: 100%; object-fit: cover; }

        /* --- Bug Reports (Light - Cards) --- */
        .bug-card {
            background: #ffffff; padding: 35px; border-radius: 4px; border: 1px solid #edf2f7;
            border-top: 4px solid var(--navy-deep); transition: 0.3s; height: 100%;
        }
        .bug-card:hover { transform: scale(1.02); border-top-color: var(--cyan-accent); box-shadow: 0 20px 40px rgba(0,0,0,0.06); }
        .bug-tech-tag { font-size: 9px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; margin-bottom: 10px; display: block; }

        #bugSlider .item { padding: 15px; }
        .bug-card {
            background: #ffffff; padding: 30px; border-radius: 4px; border: 1px solid #edf2f7; border-top: 4px solid var(--navy-deep);
            transition: 0.3s all ease-in-out; height: 200px; display: flex; flex-direction: column; justify-content: space-between; cursor: pointer;
        }
        .bug-card:hover { transform: translateY(-10px); border-top-color: var(--cyan-accent); box-shadow: 0 20px 40px rgba(0,0,0,0.08) !important; }
        .bug-title { font-size: 15px; font-weight: 700; line-height: 1.4; margin-top: 10px; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }

        #bugSlider .owl-dots { margin-top: 20px !important; }

        /* --- Awareness & Resources (Dark) --- */
        .news-item-dark {
            background: rgba(255,255,255,0.05); padding: 25px; margin-bottom: 15px;
            border-left: 4px solid var(--cyan-accent); display: flex; align-items: center;
            transition: 0.3s;
        }
        .news-item-dark:hover { background: rgba(255,255,255,0.1); transform: translateX(10px); }
        .news-date-box { min-width: 60px; text-align: center; border-right: 1px solid rgba(255,255,255,0.1); margin-right: 20px; }
        .resource-card-dark { background: #ffffff; padding: 30px; color: var(--navy-deep); border-radius: 4px; }

        /* --- Buttons --- */
        .btn-cyan { background: var(--cyan-accent); color: white; font-weight: 800; font-size: 11px; padding: 16px 40px; border-radius: 2px; text-decoration: none; display: inline-block; transition: 0.4s; }
        .btn-cyan:hover { background: #ffffff; color: var(--navy-deep); transform: translateY(-3px); }
        .btn-outline-white { border: 2px solid #ffffff; color: #ffffff; font-weight: 800; font-size: 11px; padding: 12px 30px; text-decoration: none; display: block; text-align: center; transition: 0.3s; }
        .btn-outline-white:hover { background: #ffffff; color: var(--navy-deep); }

        @media only screen and (max-width:767px) {
            .hero-banner h1 {
            font-size:3rem;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="hero-banner">
        <div class="container" data-aos="fade-up">
            <div class="col-lg-8">
                <span class="text-uppercase fw-bold small" style="letter-spacing:3px;">Evolution • Innovation • Success</span>
                <h1 class="mt-3">SOFTWARE TO POWER <br />YOUR <span>STARTUP JOURNEY</span></h1>
                <p class="mt-4">Production-ready tutorials, industrial projects, and professional bug resolution modules in Hinglish.</p>
                <div class="mt-5">
                    <a href="LearnIT.aspx" class="btn-cyan">GET STARTED NOW</a>
                </div>
            </div>
        </div>
    </section>

    <section class="section-padding bg-white">
        <div class="container">
            <div class="section-header">
                <span>Education Path</span>
                <h2>Technology Modules</h2>
            </div>
            <div class="row g-4 justify-content-center">
               <asp:Repeater ID="rptCategories" runat="server">
    <ItemTemplate>
        <div class="col-6 col-md-3 col-lg-2" data-aos="zoom-in">
<a href='learnit.aspx?cat=<%# Server.UrlEncode(Eval("CategoryName").ToString()) %>' class="text-decoration-none">
                    <div class="cat-item">
                    <div class="cat-icon-circle">
                        <i class='fa <%# Eval("IconClass") %> fa-2x'></i>
                    </div>
                    <span class="cat-name-label"><%# Eval("CategoryName") %></span>
                </div>
            </a>
        </div>
    </ItemTemplate>
</asp:Repeater>
            </div>
        </div>
    </section>

    <section class="section-padding bg-dark-section">
        <div class="container">
            <div class="section-header text-center">
                <span>Portfolio</span>
                <h2>Featured Case Studies</h2>
            </div>
            <div class="owl-carousel owl-theme" id="caseStudySlider">
                <asp:Repeater ID="rptProjects" runat="server">
                    <ItemTemplate>
                        <div class="case-slider-card">
                            <img src='admin/img/projects/<%# Eval("Thumbnail") %>' class="case-slider-img" alt='<%# Eval("Title") %> Project'>
                            <div class="p-4">
                                <span class="small fw-bold text-info text-uppercase"><%# Eval("Level") %></span>
                                <h3 class="fw-bold my-2" style="font-size: 1.1rem;"><%# Eval("Title") %></h3>
                                <a href='projectdetails.aspx?id=<%# Eval("ProjectID") %>' class="small fw-bold text-dark text-decoration-none">VIEW CASE STUDY →</a>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>

   <section class="section-padding bg-light-section">
    <div class="container">
        <div class="section-header">
            <span>Expert Bug Resolving</span>
            <h2>Solved Bug Reports</h2>
        </div>

        <div class="owl-carousel owl-theme" id="bugSlider">
            <asp:Repeater ID="rptErrors" runat="server">
                <ItemTemplate>
                    <div class="item">
                        <a href='Errors.aspx?id=<%# Eval("ErrorID") %>' class="text-decoration-none" title='Solve <%# Eval("ErrorTitle") %>'>
                            <div class="bug-card shadow-sm">
                                <div class="d-flex justify-content-between align-items-start">
                                    <span class="bug-tech-tag"><%# Eval("Technology") %></span>
                                    <i class="fas fa-bug text-muted opacity-25"></i>
                                </div>
                                <h3 class="bug-title text-dark"><%# Eval("ErrorTitle") %></h3>
                                <div class="mt-3">
                                    <span class="text-info fw-bold small">VIEW SOLUTION <i class="fas fa-arrow-right ms-1"></i></span>
                                </div>
                            </div>
                        </a>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>
        </div>
</section>

    <section class="section-padding bg-dark-section">
        <div class="container">
            <div class="row g-lg-5">
                <div class="col-lg-8" data-aos="fade-right">
                    <div class="section-header text-start mb-4">
                        <span>Latest Insights</span>
                        <h2 class="text-white">Tech Awareness</h2>
                    </div>
                    <div class="mt-4">
                        <asp:Repeater ID="rptBlogs" runat="server">
                            <ItemTemplate>
                                <div class="news-item-dark">
                                    <div class="news-date-box text-white">
                                        <h4 class="fw-bold mb-0 text-white"><%# Eval("PostDate", "{0:dd}") %></h4>
                                        <span class="small"><%# Eval("PostDate", "{0:MMM}") %></span>
                                    </div>
                                    <div class="ms-3">
                                        <a href='blogdetails.aspx?id=<%# Eval("BlogID") %>' class="h6 fw-bold text-white text-decoration-none mb-1 d-block"><%# Eval("Title") %></a>
                                        <span class="small text-white-50">Industry Insight</span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="col-lg-4 mt-5 mt-lg-0" data-aos="fade-left">
                    <div class="resource-card-dark shadow-lg">
                        <h5 class="fw-bold mb-4 text-uppercase small" style="letter-spacing:1px; color: var(--navy-deep);">Digital Resources</h5>
                        <asp:Repeater ID="rptNotes" runat="server">
                            <ItemTemplate>
                                <a href='admin/docs/<%# Eval("FilePath") %>' target="_blank" class="d-flex justify-content-between py-3 text-decoration-none text-dark border-bottom small" title='Download <%# Eval("Title") %>'>
                                    <span class="fw-bold"><%# Eval("Title") %></span>
                                    <i class="far fa-file-pdf text-danger fs-5"></i>
                                </a>
                            </ItemTemplate>
                        </asp:Repeater>
                        <div class="mt-4">
                            <a href="Notes.aspx" class="btn-outline-tech w-100" style="border: 2px solid var(--navy-deep); color: var(--navy-deep); font-weight:700; text-align:center; padding: 12px; display:block; text-decoration:none;">VIEW ALL NOTES</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        $(document).ready(function () {
            AOS.init({ duration: 800, once: true });

            $("#caseStudySlider, #bugSlider").owlCarousel({
                loop: true,
                margin: 20,
                autoplay: true,
                autoplayTimeout: 5000,
                responsive: {
                    0: { items: 1 },
                    768: { items: 2 },
                    1000: { items: 3 }
                }
            });
        });
    </script>
</asp:Content>