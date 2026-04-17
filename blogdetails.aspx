<%@ Page Title="Blog Details - itduniya.in" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="blogdetails.aspx.cs" Inherits="blogdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Read in-depth technical articles, programming tutorials, and industry insights on MERN Stack, .NET, and Software Development at IT Duniya." />
    <meta name="keywords" content="IT Tutorials, Coding Blog, MERN Stack Guide, .NET Solutions, Programming Errors Solved, Software Engineering Blog Bhilwara" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="Expert Programming Insights | IT Duniya Blog" />
    <meta property="og:description" content="Deep dive into the world of coding with our detailed blog posts and tutorials." />
    <meta property="og:type" content="article" />
    <meta property="og:url" content="https://www.itduniya.in/blogdetails.aspx" />
    <meta property="og:site_name" content="IT Duniya" />
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d; /* Image wala Navy Teal */
            --cyan-accent: #00c4cc; /* Image wala Cyan */
            --bg-gray: #f4f7f6;   /* Depth ke liye Gray */
            --text-muted: #64748b;
        }

        body { background-color: var(--bg-gray); } /* Page background gray rakha hai */

        /* --- Editorial Header Area --- */
        .detail-header {
            background-color: #ffffff;
            padding: 80px 0 120px;
            border-bottom: 1px solid #edf2f7;
            text-align: center;
        }
        .breadcrumb-tag { 
            font-size: 10px; font-weight: 800; text-transform: uppercase; 
            color: var(--cyan-accent); letter-spacing: 2.5px; display: block; margin-bottom: 20px;
        }
        .detail-header h1 { 
            color: var(--navy-deep); font-weight: 800; font-size: 2.5rem; /* Balanced size */
            max-width: 900px; margin: 10px auto 25px; line-height: 1.2;
        }
        .post-meta-info { font-size: 13px; color: var(--text-muted); font-weight: 500; }

        /* --- Article Container (Paper Style) --- */
        .article-wrapper {
            max-width: 900px;
            margin: -60px auto 100px; /* Header ke upar chadhane ke liye negative margin */
            background: #ffffff;
            padding: 60px 80px;
            box-shadow: 0 30px 60px rgba(0,0,0,0.05);
            border-top: 5px solid var(--navy-deep); /* Navy Accent Line */
            position: relative;
            z-index: 10;
        }

        /* --- Refined Content Typography --- */
        .blog-content { 
            font-size: 1.05rem; /* Readable but not 'Bda' */
            line-height: 1.8; 
            color: #334155; 
        }
        .blog-content h2, .blog-content h3 { 
            color: var(--navy-deep); font-weight: 800; margin-top: 40px; margin-bottom: 20px; 
        }
        .blog-content p { margin-bottom: 25px; }
        .blog-content img { 
            max-width: 100%; border-radius: 4px; margin: 40px 0; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.05);
        }

        /* Back Button Style */
        .back-link {
            font-size: 11px; font-weight: 800; text-transform: uppercase;
            color: var(--navy-deep); text-decoration: none; letter-spacing: 1px;
            display: inline-flex; align-items: center; margin-bottom: 40px;
            transition: 0.3s;
        }
        .back-link:hover { color: var(--cyan-accent); transform: translateX(-5px); }

        /* Mobile Adjustments */
        @media (max-width: 768px) {
            .article-wrapper { padding: 40px 25px; margin-top: -40px; }
            .detail-header h1 { font-size: 1.8rem; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="rptBlogDetail" runat="server">
        <ItemTemplate>
            <div class="detail-header">
                <div class="container" data-aos="fade-down">
                    <span class="breadcrumb-tag">Insights & Technology</span>
                    <h1><%# Eval("Title") %></h1>
                    <div class="post-meta-info">
                        <i class="far fa-calendar-alt me-2 text-info"></i> PUBLISHED ON <%# Eval("PostDate", "{0:dd MMMM yyyy}") %> 
                        <span class="mx-3 opacity-25">|</span>
                        <i class="far fa-user me-2 text-info"></i> BY IT Duniya
                    </div>
                </div>
            </div>

            <div class="container">
                <div class="article-wrapper" data-aos="fade-up">
                    <a href="blog.aspx" class="back-link">
                        <i class="fas fa-chevron-left me-2"></i> Back to Archive
                    </a>

                    <div class="blog-content">
                        <asp:Literal ID="litContent" runat="server" Text='<%# Eval("Content") %>'></asp:Literal>
                    </div>

                    <div class="mt-5 pt-5 border-top d-flex justify-content-between align-items-center">
                        <div class="small fw-bold text-uppercase opacity-50" style="letter-spacing:1px;">
                            End of Article
                        </div>
                        <div class="social-share">
                            <a href="#" class="text-muted ms-3"><i class="fab fa-facebook-f"></i></a>
                            <a href="#" class="text-muted ms-3"><i class="fab fa-twitter"></i></a>
                            <a href="#" class="text-muted ms-3"><i class="fab fa-linkedin-in"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</asp:Content>