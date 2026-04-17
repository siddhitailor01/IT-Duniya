<%@ Page Title="Solve Coding Errors: Verified Bug Fixes for BCA, BSc-IT & Developers | IT Duniya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="errors.aspx.cs" Inherits="errors" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Stuck with a coding bug? Find verified solutions to common programming errors in C++, Java, .NET, MERN Stack, and Python. Expert debugging guides for IT students and developers." />
    <meta name="keywords" content="Solved Coding Errors, Programming Bug Fixes, Debugging Solutions, IT Duniya Errors, BCA Programming Help, BSc-IT Error Solutions, SQL Error Fixes, Web Development Troubleshooting" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="Verified Coding Error Solutions & Bug Fixes - IT Duniya" />
    <meta property="og:description" content="Expert-verified solutions to your programming headaches. Search and fix your coding errors instantly." />
    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.itduniya.in/errors.aspx" />
    <meta property="og:image" content="https://www.itduniya.in/assets/images/error-share.jpg" />

    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="Fix Coding Bugs Fast | IT Duniya" />
    <meta name="twitter:description" content="Search our database of solved programming errors and keep building your projects." />

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d; /* Image Navy */
            --cyan-accent: #00c4cc; /* Image Cyan */
            --bg-gray: #f4f7f6;   /* Depth Gray */
        }

        body { background-color: var(--bg-gray); }

        /* --- Premium Header (Image 8 Style) --- */
        .error-header {
            background: linear-gradient(rgba(0, 43, 69, 0.7), rgba(0, 43, 69, 0.7)),
                        url('assets/images/errors.jpg');
            background-size: cover; background-position: center;
            padding: 50px 0; color: #ffffff;
            border-bottom: 4px solid var(--cyan-accent);
        }
        .header-tag { font-size: 11px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 2.5px; display: block; margin-bottom: 10px; }
        .header-title { font-size: 3rem; font-weight: 800; color: #ffffff; margin-bottom: 15px; }
        .header-title span { color: var(--cyan-accent); }

        /* --- Breadcrumb --- */
        .breadcrumb-nav { font-size: 13px; font-weight: 700; color: #ffffff; }
        .breadcrumb-nav a { color: #ffffff; text-decoration: none; transition: 0.3s; }
        .breadcrumb-nav a:hover { color: var(--cyan-accent); }
        .sep { margin: 0 10px; color: var(--cyan-accent); }

        /* --- Modern Search Bar --- */
        .search-box-container { margin-top: -50px; position: relative; z-index: 10; }
        .search-wrapper { background: #ffffff; padding: 25px; box-shadow: 0 20px 50px rgba(0,0,0,0.1); border-radius: 4px; }
        .search-input { border: 1px solid #e2e8f0; border-radius: 0; padding: 12px 20px; font-size: 15px; }
        .btn-search { background: var(--cyan-accent); border: none; color: white; font-weight: 700; padding: 0 40px; border-radius: 2px; }
        .btn-search:hover { background: var(--navy-deep); }

        /* --- Accordion Redesign --- */
        .accordion-item { border: none !important; margin-bottom: 20px; background: transparent; }
        .accordion-button { 
            background: #ffffff !important; color: var(--navy-deep) !important; 
            padding: 25px; border-radius: 0 !important; font-weight: 700;
            box-shadow: 0 5px 15px rgba(0,0,0,0.03) !important;
            border-left: 4px solid var(--navy-deep) !important;
        }
        .accordion-button:not(.collapsed) { 
            border-left-color: var(--cyan-accent) !important;
        }
        .accordion-button::after { filter: grayscale(1) invert(1); }

        /* Tech Badge */
        .tech-badge { 
            background: var(--navy-deep); color: var(--cyan-accent); 
            font-size: 10px; font-weight: 800; padding: 4px 10px; 
            text-transform: uppercase; letter-spacing: 1px; margin-bottom: 8px; display: inline-block;
        }

        /* Content Areas */
        .cause-box { background: #fff5f5; border-left: 3px solid #fc8181; padding: 20px; border-radius: 4px; }
        .solution-box { background: #f0fff4; border-left: 3px solid var(--cyan-accent); padding: 20px; border-radius: 4px; }
        .content-label { font-size: 12px; font-weight: 800; text-transform: uppercase; letter-spacing: 1px; margin-bottom: 10px; display: block; }
  
        .pagination-wrapper .btn {
        border-radius: 4px;
        min-width: 40px;
        transition: 0.3s;
    }
    .pagination-wrapper .btn-info {
        background-color: var(--cyan-accent);
        border-color: var(--cyan-accent);
    }
          </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="error-header">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8" data-aos="fade-right">
                    <span class="header-tag">Bug Fixes & Solutions</span>
                    <h1 class="header-title">CODING <span>ERRORS</span></h1>
                    <p class="opacity-75 small">Apni coding error search karein aur expert-verified solutions paayein.</p>
                </div>
                <div class="col-md-4 text-md-end" data-aos="fade-left">
                    <nav class="breadcrumb-nav">
                        <a href="index.aspx">Home</a>
                        <span class="sep">/</span>
                        <span style="color:var(--cyan-accent)">Errors</span>
                    </nav>
                </div>
            </div>
        </div>
    </section>

    <div class="container search-box-container">
        <div class="row justify-content-center">
            <div class="col-lg-10" data-aos="zoom-in">
                <div class="search-wrapper">
                    <div class="input-group">
                        <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control search-input" placeholder="Search error (e.g. NullReference, SQL, 404)"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="SEARCH SOLUTIONS" OnClick="btnSearch_Click" CssClass="btn-search" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="container my-5 py-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="accordion" id="errorAccordion">
                    <asp:Repeater ID="rptErrors" runat="server">
                        <ItemTemplate>
                            <div class="accordion-item" data-aos="fade-up">
                                <h2 class="accordion-header">
                                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target='#collapse<%# Eval("ErrorID") %>'>
                                        <div class="w-100">
                                            <span class="tech-badge"><%# Eval("Technology") %></span><br />
                                            <span style="font-size: 1.1rem;"><%# Eval("ErrorTitle") %></span>
                                        </div>
                                    </button>
                                </h2>
                                <div id='collapse<%# Eval("ErrorID") %>' class='<%# Request.QueryString["id"] != null ? "accordion-collapse collapse show" : "accordion-collapse collapse" %>' data-bs-parent="#errorAccordion">
                                    <div class="accordion-body bg-white border-top p-4 p-md-5">
                                        <div class="row g-4">
                                            <div class="col-md-5">
                                                <div class="cause-box h-100">
                                                    <span class="content-label text-danger"><i class="fas fa-bug me-2"></i> The Cause</span>
                                                    <p class="text-muted small mb-0"><%# Eval("Cause") %></p>
                                                </div>
                                            </div>
                                            <div class="col-md-7">
                                                <div class="solution-box h-100">
                                                    <span class="content-label text-success"><i class="fas fa-terminal me-2"></i> The Solution</span>
                                                    <div class="text-secondary small">
                                                        <asp:Literal ID="litSolution" runat="server" Text='<%# Eval("Solution") %>'></asp:Literal>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="text-end mt-4">
                                            <hr class="opacity-10" />
                                            <span class="text-muted" style="font-size: 11px; font-weight:700;">SOLVED BY IT DUNIYA • <%# Eval("PostedDate", "{0:dd MMM yyyy}") %></span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                    <div class="pagination-wrapper text-center mt-5">
    <asp:Repeater ID="rptPagination" runat="server" OnItemCommand="rptPagination_ItemCommand">
        <ItemTemplate>
            <asp:LinkButton ID="lnkPage" runat="server" 
                CommandName="Page" 
                CommandArgument='<%# Container.DataItem %>'
                CssClass='<%# "btn btn-sm mx-1 " + (Convert.ToInt32(Container.DataItem) == CurrentPage ? "btn-info text-white fw-bold" : "btn-outline-secondary") %>'>
                <%# Convert.ToInt32(Container.DataItem) + 1 %>
            </asp:LinkButton>
        </ItemTemplate>
    </asp:Repeater>
</div>
                </div>

                <asp:Panel ID="pnlNoData" runat="server" Visible="false" CssClass="text-center p-5 bg-white shadow-sm mt-4">
                    <i class="fas fa-search-minus fa-3x text-muted mb-3"></i>
                    <h5 class="fw-bold text-dark">Error Not Found!</h5>
                    <p class="text-muted small">Humein contact karein, hum iska solution jald hi add karenge.</p>
                    <a href="contact.aspx" class="btn btn-sm btn-outline-info rounded-pill px-4 mt-2">Request Solution</a>
                </asp:Panel>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</asp:Content>