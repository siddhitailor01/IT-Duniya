<%@ Page Title="Download BCA & BSc-IT Study Notes PDF | Programming Resources - IT Duniya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="notes.aspx.cs" Inherits="notes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Access premium study notes for BCA, BSc-IT, and Engineering students. Download verified PDF notes for Java, Python, C++, Networking, and DBMS curated by IT Duniya." />
    <meta name="keywords" content="BCA Study Notes PDF, BSc-IT Notes, Programming PDF Download, IT Duniya Notes, Computer Science Study Material, Bhilwara IT Resources, DBMS Notes PDF, Learn Coding Notes" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:type" content="website" />
    <meta property="og:url" content="https://www.itduniya.in/notes.aspx" />
    <meta property="og:title" content="Verified IT Study Notes & PDF Materials - IT Duniya" />
    <meta property="og:description" content="Empowering IT students with high-quality PDF notes for all programming subjects. Download now!" />
    <meta property="og:image" content="https://www.itduniya.in/assets/images/notes-share.jpg" />

    <meta name="twitter:card" content="summary_large_image" />
    <meta name="twitter:title" content="IT Study Materials & PDF Notes | IT Duniya" />
    <meta name="twitter:description" content="Get your BCA and BSc-IT exam preparation started with our expert notes." />

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d; /* Image Navy */
            --cyan-accent: #00c4cc; /* Image Cyan */
            --bg-gray: #f4f7f6;   /* Depth Gray */
            --text-muted: #64748b;
        }

        body { background-color: var(--bg-gray); }

        /* --- Premium Header --- */
        .notes-hero {
            background: linear-gradient(rgba(0, 58, 77, 0.6), rgba(0, 58, 77, 0.6)), 
                        url('assets/images/notes.jpg');
            background-size: cover; background-position: center;
            padding: 50px 0; color: #ffffff;
            border-bottom: 4px solid var(--cyan-accent);
        }
        .header-tag { font-size: 11px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 2.5px; display: block; margin-bottom: 10px; }
        .header-title { font-size: 3rem; font-weight: 800; color: #ffffff; margin-bottom: 15px; text-transform: uppercase; }
        .header-title span { color: var(--cyan-accent); }

        .breadcrumb-box { font-size: 13px; font-weight: 700; color: #ffffff; }
        .breadcrumb-box a { color: #ffffff; text-decoration: none; transition: 0.3s; }
        .breadcrumb-box a:hover { color: var(--cyan-accent); }
        .sep { margin: 0 10px; color: var(--cyan-accent); }

        .search-overlap { margin-top: -45px; position: relative; z-index: 10; }
        .search-card { 
            background: #ffffff; padding: 25px; 
            box-shadow: 0 20px 50px rgba(0,0,0,0.08); 
            border-radius: 4px; border: 1px solid #edf2f7;
        }
        .search-control { 
            border: none; border-bottom: 2px solid #e2e8f0; 
            border-radius: 0; padding: 12px 0; font-size: 14px;
        }
        .search-control:focus { box-shadow: none; border-bottom-color: var(--cyan-accent); }
        .btn-search-tech { 
            background: var(--cyan-accent); color: white; border: none; 
            font-weight: 800; font-size: 12px; padding: 0 35px; border-radius: 2px; line-height:45px;
        }
        .btn-search-tech:hover { background: var(--navy-deep); }

        .notes-wrapper {
            background: #ffffff;
            padding: 50px;
            margin-bottom: 80px;
            box-shadow: 0 10px 30px rgba(0,0,0,0.02);
            border-top: 5px solid var(--navy-deep);
        }
        .notes-list-title { font-size: 11px; font-weight: 800; color: var(--navy-deep); text-transform: uppercase; letter-spacing: 2px; margin-bottom: 40px; border-left: 3px solid var(--cyan-accent); padding-left: 15px; }

        .note-item {
            display: flex; justify-content: space-between; align-items: center;
            padding: 25px 0; border-bottom: 1px dotted #cbd5e1;
            transition: 0.3s;
        }
        .note-item:last-child { border: none; }
        .note-item:hover { padding-left: 10px; background: #fafbfc; }

        .note-icon-box { 
            width: 50px; height: 50px; background: var(--bg-gray); 
            display: flex; align-items: center; justify-content: center; 
            border-radius: 4px; color: #ef4444; font-size: 22px;
        }

        .note-title { font-size: 15px; font-weight: 700; color: var(--navy-deep); margin-bottom: 4px; display: block; text-decoration: none; }
        .note-cat-badge { font-size: 9px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 1px; }

        .btn-download-startup {
            border: 2px solid var(--navy-deep);
            color: var(--navy-deep);
            font-size: 11px; font-weight: 800; text-transform: uppercase;
            padding: 10px 25px; border-radius: 2px; text-decoration: none; transition: 0.3s;
        }
        .btn-download-startup:hover { background: var(--navy-deep); color: white; box-shadow: 0 10px 20px rgba(0,43,69,0.15); }

        @media (max-width: 768px) {
            .notes-hero { text-align: center; padding: 60px 0; }
            .breadcrumb-box { margin-top: 20px; justify-content: center; display: flex; }
            .notes-wrapper { padding: 30px 20px; }
            .note-item { flex-direction: column; text-align: center; gap: 20px; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="notes-hero">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-md-8" data-aos="fade-right">
                    <span class="header-tag">Educational Resources</span>
                    <h1 class="header-title">STUDY <span>NOTES</span></h1>
                    <p class="opacity-75 small">BCA, BSc-IT aur programming ke high-quality PDF notes yahan se access karein.</p>
                </div>
                <div class="col-md-4 text-md-end" data-aos="fade-left">
                    <nav class="breadcrumb-box">
                        <a href="index.aspx">Home</a>
                        <span class="sep">/</span>
                        <span style="color:var(--cyan-accent)">Study Materials</span>
                    </nav>
                </div>
            </div>
        </div>
    </section>

    <div class="container search-overlap">
        <div class="row justify-content-center">
            <div class="col-lg-10" data-aos="zoom-in">
                <div class="search-card">
                    <asp:Panel ID="pnlSearch" runat="server" DefaultButton="btnSearch">
                        <div class="input-group">
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control search-control" placeholder="Search notes by title or subject (e.g. Java, C++, Database)..."></asp:TextBox>
                            <asp:LinkButton ID="btnSearch" runat="server" CssClass="btn btn-search-tech" OnClick="btnSearch_Click">
                                <i class="fas fa-search me-2"></i> SEARCH NOTES
                            </asp:LinkButton>
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>

    <div class="container my-5 pt-4">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                <div class="notes-wrapper" data-aos="fade-up">
                    <h2 class="notes-list-title">All Study Materials</h2>
                    
                    <asp:Label ID="lblNoResult" runat="server" Text="No notes found matching your search criteria." CssClass="text-center text-muted d-block py-5 fw-bold" Visible="false"></asp:Label>

                    <div class="notes-list">
                        <asp:Repeater ID="rptNotesList" runat="server">
                            <ItemTemplate>
                                <div class="note-item" data-aos="fade-up">
                                    <div class="d-flex align-items-center">
                                        <div class="note-icon-box me-4">
                                            <i class="fas fa-file-pdf"></i>
                                        </div>
                                        <div>
                                            <a href='admin/docs/<%# Eval("FilePath") %>' target="_blank" class="note-title" title='Download <%# Eval("Title") %> PDF'><%# Eval("Title") %></a>
                                            <span class="note-cat-badge"><%# Eval("Category") %></span>
                                            <span class="mx-2 opacity-25">|</span>
                                            <small class="text-muted" style="font-size:11px;"><i class="far fa-clock me-1"></i> <%# Eval("UploadDate", "{0:dd MMM yyyy}") %></small>
                                        </div>
                                    </div>
                                    <div>
                                        <a href='admin/docs/<%# Eval("FilePath") %>' target="_blank" class="btn-download-startup">
                                            <i class="fas fa-download me-2"></i> Download PDF
                                        </a>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>

                <div class="p-5 text-center shadow-lg mb-5" style="background:var(--navy-deep);" data-aos="zoom-in">
                    <h3 class="text-white fw-bold mb-3">Can't find what you're looking for?</h3>
                    <p class="text-white-50 small mb-4">Humein batayein ki aapko kis subject ke notes chahiye, hum jald hi upload karenge.</p>
                    <a href="contact.aspx" class="btn btn-info rounded-0 px-5 fw-bold text-white py-3" style="background:var(--cyan-accent); border:none;">REQUEST NOTES</a>
                </div>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
  <script type="text/javascript">
      window.onpageshow = function (event) {
          // Browser ki navigation history check karein
          var perfEntries = performance.getEntriesByType("navigation");

          if (perfEntries.length > 0) {
              var navType = perfEntries[0].type;

              // 'reload' ka matlab hai F5 (Refresh)
              // 'back_forward' ka matlab hai Back Button
              if (navType === 'reload' || navType === 'back_forward' || event.persisted) {
                  var searchBox = document.getElementById('<%= txtSearch.ClientID %>');
                if (searchBox) {
                    searchBox.value = ""; // Sirf inhi cases mein khali karega
                }
            }
            // Agar navType 'navigate' hai (yani Search button click), toh ye khali nahi karega
        }
    };
</script>
</asp:Content>