<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="tutorialdetails.aspx.cs" Inherits="tutorialdetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Learn step-by-step programming with detailed theory, logic diagrams, and production-ready source code. Perfect for BCA, BSc-IT, and Engineering students." />
    <meta name="keywords" content="Programming Tutorial, Source Code, Logic Building, IT Duniya Tutorials, BCA Programming Notes, BSc-IT Learning, Code Implementation, Technical Guide" />
    <meta name="author" content="IT Duniya" />
    <meta name="robots" content="index, follow" />

    <meta property="og:title" content="Programming Tutorial & Source Code Implementation | IT Duniya" />
    <meta property="og:description" content="Deep dive into technical concepts with real-world code examples and diagrams." />
    <meta property="og:type" content="article" />
    <meta property="og:url" content='<%= Request.Url.AbsoluteUri %>' />
    <meta property="og:site_name" content="IT Duniya" />

    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d;
            --cyan-accent: #00c4cc;
            --bg-gray: #f4f7f6;
        }

        body { background-color: var(--bg-gray); }

        /* --- Optimized Header --- */
        .details-header {
            background-color: #ffffff;
            padding: 30px 0 50px;
            border-bottom: 1px solid #edf2f7;
            text-align: center;
        }
        .header-main-title { color: var(--navy-deep); font-weight: 800; font-size: 2rem; margin-bottom: 10px; }

        /* --- Split Layout Wrapper --- */
        .tutorial-paper-wide {
            max-width: 1200px;
            margin: -30px auto 60px;
            background: #ffffff;
            padding: 40px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.05);
            border-top: 4px solid var(--navy-deep);
            z-index: 10; position: relative;
        }

        .theory-col { 
            font-size: 0.95rem; line-height: 1.7; color: #334155; 
            padding-right: 30px; border-right: 1px solid #f1f5f9; 
        }

        .media-col { padding-left: 30px; }

        .code-window { 
            background: #0f172a; color: #e2e8f0; 
            padding: 20px; border-radius: 4px; 
            font-family: 'Consolas', monospace; font-size: 0.85rem;
            position: relative; max-height: 500px; overflow-y: auto;
        }
        .copy-btn { 
            position: absolute; top: 10px; right: 10px; 
            background: rgba(255,255,255,0.1); color: #fff; 
            border: 1px solid rgba(255,255,255,0.2); font-size: 10px; 
            padding: 4px 10px; font-weight: 700; cursor: pointer;
        }
        .copy-btn:hover { background: var(--cyan-accent); }

        .section-label { 
            font-size: 11px; font-weight: 800; text-transform: uppercase; 
            color: var(--navy-deep); letter-spacing: 1.5px; margin-bottom: 15px; display: block; 
        }

        .diagram-box-sm { 
            background: var(--bg-gray); padding: 15px; border-radius: 4px; 
            text-align: center; border: 1px solid #e2e8f0; margin-bottom: 25px;
        }
        .diagram-box-sm img { max-width: 100%; height: auto; border-radius: 2px; }

        @media (max-width: 991px) {
            .theory-col { padding-right: 0; border-right: none; margin-bottom: 40px; }
            .media-col { padding-left: 0; }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Repeater ID="rptFullTutorial" runat="server">
        <ItemTemplate>
            <div class="details-header">
                <div class="container" data-aos="fade-down">
                    <span class="small fw-bold text-uppercase" style="color:var(--cyan-accent); letter-spacing:2px;"><%# Eval("Category") %></span>
                    <h1 class="header-main-title"><%# Eval("Title") %></h1>
                    <div class="small text-muted fw-bold">ID: TUT-<%# Eval("TutorialID") %> | Updated: <%# Eval("PostDate", "{0:dd MMM yyyy}") %></div>
                </div>
            </div>

            <div class="container-fluid px-lg-5">
                <div class="tutorial-paper-wide" data-aos="fade-up">
                    <a href="learnit.aspx" class="text-decoration-none small fw-bold mb-4 d-inline-block" style="color:var(--navy-deep);">
                        <i class="fas fa-chevron-left me-1"></i> BACK TO LIST
                    </a>

                    <div class="row">
                        <div class="col-lg-6 theory-col">
                            <h2 class="section-label text-info" style="font-size: 11px;">Concept & Theory</h2>
                            <div class="theory-text">
                                <asp:Literal ID="litTheory" runat="server" Text='<%# Eval("TheoryContent") %>'></asp:Literal>
                            </div>
                        </div>

                        <div class="col-lg-6 media-col">
                            
                            <asp:PlaceHolder ID="phDiagram" runat="server" Visible='<%# !string.IsNullOrEmpty(Eval("DiagramUrl").ToString()) %>'>
                                <span class="section-label">Illustration</span>
                                <div class="diagram-box-sm">
                                    <img src='<%# Eval("DiagramUrl") %>' alt="Technical Illustration Diagram" />
                                </div>
                            </asp:PlaceHolder>

                            <asp:PlaceHolder ID="phCode" runat="server" Visible='<%# !string.IsNullOrEmpty(Eval("CodeSnippet").ToString()) %>'>
                                <h3 class="section-label" style="font-size: 11px;">Source Code Implementation</h3>
                                <div class="code-window shadow-sm">
                                    <button type="button" class="copy-btn" onclick="copyCode(this)">COPY CODE</button>
                                    <pre><code><%# Eval("CodeSnippet") %></code></pre>
                                </div>
                            </asp:PlaceHolder>

                            <div class="mt-4 p-3 small" style="background:#fff9db; border-left:4px solid #fab005;">
                                <strong>Note:</strong> Is code ko apne local compiler par run karke outputs verify karein.
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </ItemTemplate>
    </asp:Repeater>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({ duration: 800, once: true });
        function copyCode(btn) {
            var code = btn.nextElementSibling.innerText;
            navigator.clipboard.writeText(code).then(() => {
                btn.innerText = "COPIED!";
            btn.style.background = "#00c4cc";
            setTimeout(() => { btn.innerText = "COPY CODE"; btn.style.background = "rgba(255,255,255,0.1)"; }, 2000);
        });
        }
    </script>
</asp:Content>