<%@ Page Title="Tech Pulse: Programming, MERN Stack & Developer Life Blog | IT Duniya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="blog.aspx.cs" Inherits="blog" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Explore Tech Pulse by IT Duniya: Your go-to source for MERN stack tutorials, .NET insights, career guidance for BCA/BSc-IT students, and the latest programming trends." />
    <meta name="keywords" content="IT Blog, Programming Tutorials, MERN Stack Insights, .NET Developer Blog, Tech News India, BCA Student Resources, Coding Career Guidance, IT Duniya Blog" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="Tech Pulse Insights - Programming & Career Blog by IT Duniya" />
    <meta property="og:description" content="Master coding with our professional articles on modern stacks and developer life stories." />
    <meta property="og:type" content="blog" />
    <meta property="og:url" content="https://www.itduniya.in/blog.aspx" />
    <meta property="og:image" content="https://www.itduniya.in/assets/images/blog-share.jpg" />

    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="IT Duniya Tech Blog - Learn, Build, Succeed" />
    <meta name="twitter:description" content="Daily insights into the world of programming and software development." />

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d; /* Image wala Navy Teal */
            --cyan-accent: #00c4cc; /* Image wala Cyan */
            --bg-gray: #f4f7f6;   /* Section depth ke liye Gray */
            --text-muted: #718096;
        }

        body { background-color: #ffffff; }

        /* --- Editorial Header (Gray Depth) --- */
        .blog-hero {
            background-color: var(--bg-gray);
            padding: 80px 0;
            border-bottom: 1px solid #e2e8f0;
            margin-bottom: 60px;
        }
        .breadcrumb-tag { 
            font-size: 10px; font-weight: 800; text-transform: uppercase; 
            color: var(--cyan-accent); letter-spacing: 2.5px; 
        }
        .blog-hero h1 { 
            color: var(--navy-deep); font-weight: 800; font-size: 2.6rem; 
            letter-spacing: -1px; margin-top: 10px; 
        }

        /* --- Refined Post Cards (Color Blocking) --- */
        .post-container {
            background: #ffffff;
            border: 1px solid #edf2f7;
            padding: 40px;
            margin-bottom: 40px;
            transition: 0.4s;
            border-left: 4px solid var(--navy-deep); /* Navy Accent Line */
        }
        .post-container:hover {
            border-left-color: var(--cyan-accent);
            box-shadow: 0 20px 40px rgba(0,0,0,0.04);
            transform: translateX(5px);
        }

        .post-meta {
            font-size: 11px;
            font-weight: 700;
            color: var(--cyan-accent);
            text-transform: uppercase;
            letter-spacing: 1px;
            margin-bottom: 15px;
            display: block;
        }

        .post-title {
            font-size: 1.3rem; /* Controlled Font Size */
            font-weight: 700;
            color: var(--navy-deep);
            line-height: 1.4;
            margin-bottom: 15px;
            text-decoration: none;
            display: block;
            transition: 0.3s;
        }
        .post-title:hover { color: var(--cyan-accent); }

        .post-excerpt {
            font-size: 0.9rem; /* Small & Clean Font */
            color: var(--text-muted);
            line-height: 1.7;
            margin-bottom: 25px;
        }

        .read-more-link {
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            color: var(--navy-deep);
            text-decoration: none;
            border-bottom: 2px solid var(--cyan-accent);
            padding-bottom: 4px;
            transition: 0.3s;
        }
        .read-more-link:hover { color: var(--cyan-accent); border-bottom-color: var(--navy-deep); }

        /* --- Sidebar Redesign (Contrast focus) --- */
        .sidebar-widget {
            background: var(--bg-gray); /* White page par gray sidebar card */
            padding: 35px;
            margin-bottom: 30px;
        }
        .widget-title {
            font-size: 12px; font-weight: 800; color: var(--navy-deep);
            text-transform: uppercase; letter-spacing: 1.5px;
            margin-bottom: 25px; border-bottom: 2px solid var(--cyan-accent);
            display: inline-block; padding-bottom: 5px;
        }

        .dark-cta {
            background: var(--navy-deep);
            color: white;
            padding: 40px 30px;
            text-align: center;
        }
        /* --- Execoore Page Title Section (Image 8 Style) --- */
.page-title-section {
    background: linear-gradient(rgba(0, 43, 69, 0.7), rgba(0, 43, 69, 0.7)), 
                url('assets/images/blog.jpg');
    background-size: cover;
    background-position: center;
    padding: 50px 0;
    color: #ffffff;
    border-bottom: 4px solid var(--cyan-accent); /* Execoore Cyan Accent */
}
/* Category Tag below Title */
.blog-category-tag {
    font-size: 11px;
    font-weight: 800;
    color: var(--cyan-accent);
    text-transform: uppercase;
    letter-spacing: 2px;
    display: block;
    margin-bottom: 10px;
}

.page-main-title {
    font-size: 3rem;
    font-weight: 800;
    letter-spacing: -1px;
    margin-bottom: 15px;
    text-transform: uppercase;
}

.page-main-title span {
    color: var(--cyan-accent); /* Insights in Cyan */
}

.page-sub-desc {
    font-size: 14px;
    color: rgba(255,255,255,0.7);
    max-width: 500px;
}

/* Breadcrumb Styling (Right Side) */
.breadcrumb-path {
    font-size: 13px;
    font-weight: 700;
}

.breadcrumb-path a {
    color: #ffffff;
    text-decoration: none;
    transition: 0.3s;
}

.breadcrumb-path a:hover {
    color: var(--cyan-accent);
}

.breadcrumb-path .separator {
    margin: 0 10px;
    color: var(--cyan-accent);
}

.breadcrumb-path .current {
    color: var(--cyan-accent);
}

/* Mobile Adjustments */
@media (max-width: 768px) {
    .page-title-section { text-align: center; padding: 60px 0; }
    .breadcrumb-path { margin-top: 20px; justify-content: center; display: flex; }
    .page-main-title { font-size: 2rem; }
}
/* Sidebar Themes Scrollbar Fix */
.theme-list-container {
    max-height: 300px; /* 6-8 themes ke baad scroll chalega */
    overflow-y: auto;
    padding-right: 10px;
}

/* Custom Scrollbar for Chrome/Safari */
.theme-list-container::-webkit-scrollbar {
    width: 4px;
}
.theme-list-container::-webkit-scrollbar-track {
    background: #f1f1f1;
}
.theme-list-container::-webkit-scrollbar-thumb {
    background: var(--cyan-accent);
    border-radius: 10px;
}
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <section class="page-title-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-8" data-aos="fade-right">
                <span class="blog-category-tag">BLOG CLASSIC</span>
                <h1 class="page-main-title">TECH PULSE <span>INSIGHTS</span></h1>
                <p class="page-sub-desc">Professional articles on MERN, .NET, and the life of a developer.</p>
            </div>
            
            <div class="col-md-4 text-md-end" data-aos="fade-left">
                <nav class="breadcrumb-path">
                    <a href="index.aspx">Home</a>
                    <span class="separator">/</span>
                    <span class="current">Journal & News</span>
                </nav>
            </div>
        </div>
    </div>
</section>

    <div class="container mb-5 pb-5 mt-4">
        <div class="row g-lg-5">
            <div class="col-lg-8">
                <asp:Repeater ID="rptBlogs" runat="server">
                    <ItemTemplate>
                        <div class="post-container" data-aos="fade-up">
                            <span class="post-meta">
                                <i class="far fa-calendar-alt me-2"></i><%# Eval("PostDate", "{0:dd MMM yyyy}") %> • Insight
                            </span>
                            
                            <a href='blogdetails.aspx?id=<%# Eval("BlogID") %>' class="post-title">
                                <%# Eval("Title") %>
                            </a>
                            
                            <p class="post-excerpt">
                                <%# StripHTML(Eval("Content").ToString()).Length > 150 ? 
                                    StripHTML(Eval("Content").ToString()).Substring(0, 150) + "..." : 
                                    StripHTML(Eval("Content").ToString()) %>
                            </p>
                            
                            <a href='blogdetails.aspx?id=<%# Eval("BlogID") %>' class="read-more-link">
                                Read Entire Post <i class="fas fa-arrow-right ms-2" style="font-size:9px;"></i>
                            </a>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                     <div class="pagination-box d-flex justify-content-between mt-5">
    <asp:LinkButton ID="btnPrev" runat="server" OnClick="btnPrev_Click" CssClass="read-more-link" Style="border:1px solid var(--navy-deep); padding:10px 20px;">
        <i class="fas fa-chevron-left me-2"></i> Previous
    </asp:LinkButton>
    <asp:LinkButton ID="btnNext" runat="server" OnClick="btnNext_Click" CssClass="read-more-link" Style="border:1px solid var(--navy-deep); padding:10px 20px;">
        Next <i class="fas fa-chevron-right ms-2"></i>
    </asp:LinkButton>
</div>
            </div>


            <div class="col-lg-4">
         <div class="sidebar-widget" data-aos="fade-left">
    <h3 class="widget-title">Content Themes</h3>
    <div class="theme-list-container"> <ul class="list-unstyled mb-0">
            <asp:Repeater ID="rptThemes" runat="server">
                <ItemTemplate>
                    <li class="mb-3">
                        <a href='blog.aspx?theme=<%# Eval("Theme") %>' class="text-decoration-none text-dark small fw-bold">
                            <i class="fas fa-chevron-right me-2 text-info" style="font-size:10px;"></i> 
                            <%# Eval("Theme") %>
                        </a>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
    </div>
</div>
            

                <div class="dark-cta shadow-lg" data-aos="zoom-in">
                    <h6 class="text-white fw-bold mb-3 text-uppercase" style="letter-spacing:1px;">Need Mentoring?</h6>
                    <p class="text-white-50" style="font-size:11px; line-height:1.8;">Get direct answers to your technical career questions from IT Duniya.</p>
                    <a href="Contact.aspx" class="btn btn-sm btn-info w-100 rounded-0 fw-bold mt-2 py-2" style="background:var(--cyan-accent); border:none; color:white;">SEND MESSAGE</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</asp:Content>