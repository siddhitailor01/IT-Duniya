<%@ Page Title="Learn IT: Programming Tutorials | IT Duniya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="learnit.aspx.cs" Inherits="learnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
    
    <style>
        :root { --navy-deep: #003a4d; --cyan-accent: #00c4cc; --bg-gray: #f4f7f6; --text-muted: #64748b; }
        body { background-color: #ffffff; }

        /* Header Style */
        .page-title-area {
            background: linear-gradient(rgba(0, 58, 77, 0.65), rgba(0, 58, 77, 0.65)), url('assets/images/learnit.jpg');
            background-size: cover; background-position: center; padding: 50px 0; color: #ffffff; border-bottom: 4px solid var(--cyan-accent);
        }
        .header-main-title { font-size: 3rem; font-weight: 800; text-transform: uppercase; }
        .header-main-title span { color: var(--cyan-accent); }

        /* Filter Section & Slider */
        .filter-section { background-color: var(--bg-gray); padding: 30px 0; border-bottom: 1px solid #e2e8f0; position: sticky; top: 70px; z-index: 100; }
        .tut-category-btn { font-size: 11px; font-weight: 800; text-transform: uppercase; letter-spacing: 1px; border-radius: 4px; padding: 10px 25px; transition: 0.4s; }
        .btn-active { background-color: var(--navy-deep) !important; color: white !important; border: none; }
        .btn-inactive { background-color: white; color: var(--navy-deep); border: 1px solid #e2e8f0; }

        /* Slider Mobile Arrows Fix */
        .slick-prev:before, .slick-next:before { color: var(--navy-deep) !important; font-size: 24px; }
        @media (max-width: 768px) {
            .category-slider-wrapper { padding: 0 40px !important; }
            .slick-prev, .slick-next { width: 35px; height: 35px; border-radius: 50%; z-index: 10; background: rgba(255,255,255,0.9) !important; display: flex !important; align-items: center; justify-content: center; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
            .slick-prev { left: 5px !important; } .slick-next { right: 5px !important; }
            .slick-prev:before, .slick-next:before { font-size: 18px !important; }
        }

        /* Tutorial Cards */
        .premium-tut-card { background: #ffffff; border: 1px solid #edf2f7; padding: 35px; transition: 0.4s; border-top: 4px solid var(--navy-deep); position: relative; }
        .premium-tut-card:hover { border-top-color: var(--cyan-accent); box-shadow: 0 20px 40px rgba(0,0,0,0.06); transform: translateY(-5px); }
        .tut-title { font-size: 1.2rem; font-weight: 800; color: var(--navy-deep); margin-bottom: 15px; display: block; text-decoration: none; }
        .category-badge { font-size: 9px; font-weight: 800; color: var(--cyan-accent); text-transform: uppercase; letter-spacing: 1.5px; display: block; margin-bottom: 10px; }

        /* Pagination */
        .btn-active-page { background: var(--navy-deep) !important; color: #fff !important; font-weight: bold; border-radius: 4px; padding: 8px 16px; border:none; }
        .btn-inactive-page { background: #fff; color: var(--navy-deep); border: 1px solid #dee2e6; border-radius: 4px; padding: 8px 16px; transition: 0.3s; margin: 0 3px; }
        .btn-inactive-page:hover { border-color: var(--cyan-accent); color: var(--cyan-accent); }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <section class="page-title-area">
        <div class="container">
            <h1 class="header-main-title">LEARN <span>IT</span></h1>
            <p class="opacity-75">Quality technical tutorials for future developers.</p>
        </div>
    </section>

    <div class="filter-section shadow-sm">
        <div class="container">
            <div class="category-slider-wrapper">
                <div class="slider-item">
                    <asp:LinkButton ID="btnAll" runat="server" OnClick="Filter_Click" CommandArgument="All" CssClass="btn btn-active tut-category-btn">All Modules</asp:LinkButton>
                </div>
                <asp:Repeater ID="rptFilterCategories" runat="server">
                    <ItemTemplate>
                        <div class="slider-item">
                            <asp:LinkButton ID="btnCat" runat="server" OnClick="Filter_Click" CommandArgument='<%# Eval("CategoryName") %>' CssClass="btn btn-inactive tut-category-btn"><%# Eval("CategoryName") %></asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </div>

    <div class="container my-5 py-5">
        <asp:Panel ID="pnlNoTutorials" runat="server" Visible="false" CssClass="text-center py-5">
            <div style="background: var(--bg-gray); padding: 50px; border-top: 4px solid var(--cyan-accent);">
                <h4 class="fw-bold">COMING SOON</h4>
                <p>Nayi classes jald hi shuru hongi!</p>
            </div>
        </asp:Panel>

        <div class="row g-4"> <asp:Repeater ID="rptTutorials" runat="server">
                <ItemTemplate>
                    <div class="col-md-6 col-lg-4 mb-3 g-3" data-aos="fade-up">
                        <div class="premium-tut-card h-100">
                            <span class="category-badge"><%# Eval("Category") %></span>
                            <a href='tutorialdetails.aspx?id=<%# Eval("TutorialID") %>' class="tut-title"><%# Eval("Title") %></a>
                            <p class="text-muted small"><%# StripHTML(Eval("TheoryContent").ToString()).Length > 110 ? StripHTML(Eval("TheoryContent").ToString()).Substring(0, 110) + "..." : StripHTML(Eval("TheoryContent").ToString()) %></p>
                            <a href='tutorialdetails.aspx?id=<%# Eval("TutorialID") %>' class="btn btn-link p-0 text-decoration-none fw-bold" style="color:var(--cyan-accent); font-size:12px;">READ MORE →</a>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>
        </div>

        <div class="pagination-container text-center mt-5">
            <asp:Repeater ID="rptPagination" runat="server" OnItemCommand="rptPagination_ItemCommand">
                <ItemTemplate>
                    <asp:LinkButton ID="lnkPage" runat="server" CommandName="Page" CommandArgument='<%# Container.DataItem %>'
                        CssClass='<%# "btn " + (Convert.ToInt32(Container.DataItem) == CurrentPage ? "btn-active-page" : "btn-inactive-page") %>'>
                        <%# Convert.ToInt32(Container.DataItem) + 1 %>
                    </asp:LinkButton>
                </ItemTemplate>
            </asp:Repeater>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        $(document).ready(function () {
            $('.category-slider-wrapper').slick({
                dots: false, infinite: false, speed: 300, slidesToShow: 5, slidesToScroll: 2, arrows: true,
                responsive: [{ breakpoint: 1200, settings: { slidesToShow: 3 } }, { breakpoint: 768, settings: { slidesToShow: 2 } }]
            });
            AOS.init({ duration: 1000, once: true });
        });
    </script>
</asp:Content>