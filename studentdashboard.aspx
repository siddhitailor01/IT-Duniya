<%@ Page Title="Student Dashboard | Manage Your Learning & Projects - IT Duniya" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="studentdashboard.aspx.cs" Inherits="studentdashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <meta name="description" content="Access your personalized IT Duniya student dashboard to track tutorials, solve coding errors, and manage project inquiries." />
    <meta name="robots" content="noindex, nofollow" /> <link href="https://unpkg.com/aos@2.3.1/dist/aos.css" rel="stylesheet">
    <style>
        :root {
            --navy-deep: #003a4d;
            --cyan-accent: #00c4cc;
            --bg-gray: #f4f7f6;
        }

        body { background-color: var(--bg-gray); }

        /* --- Dashboard Layout --- */
        .dash-container { padding: 60px 0; }
        
        /* Sidebar Redesign */
        .dash-sidebar { 
            background: #ffffff; border-radius: 4px; padding: 30px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.02); border-top: 4px solid var(--navy-deep);
        }
        .sidebar-link { 
            padding: 15px 20px; display: block; color: var(--navy-deep); 
            font-weight: 700; text-transform: uppercase; font-size: 11px; 
            letter-spacing: 1px; text-decoration: none; border-bottom: 1px dotted #e2e8f0;
        }
        .sidebar-link:hover, .sidebar-link.active { color: var(--cyan-accent); padding-left: 25px; transition: 0.3s; }
        .sidebar-link i { width: 25px; }

        /* Main Content Cards */
        .dash-card { 
            background: #ffffff; border-radius: 4px; padding: 40px; 
            box-shadow: 0 10px 30px rgba(0,0,0,0.02); margin-bottom: 30px;
        }
        .section-title { 
            font-size: 12px; font-weight: 800; color: var(--navy-deep); 
            text-transform: uppercase; letter-spacing: 2px; margin-bottom: 30px; 
            border-left: 3px solid var(--cyan-accent); padding-left: 15px;
        }

        /* GridView Premium Style */
        .table-premium { font-size: 14px; }
        .table-premium th { 
            background: var(--bg-gray); color: var(--navy-deep); 
            text-transform: uppercase; font-size: 11px; letter-spacing: 1px; padding: 15px; border: none;
        }
        .table-premium td { padding: 18px 15px; border-bottom: 1px dotted #cbd5e1; vertical-align: middle; }

        /* Status Badges */
        .badge-waiting { background: #fff7ed; color: #c2410c; border: 1px solid #ffedd5; padding: 5px 12px; font-size: 10px; font-weight: 800; }
        .badge-replied { background: #f0fdf4; color: #15803d; border: 1px solid #dcfce7; padding: 5px 12px; font-size: 10px; font-weight: 800; }

        .btn-startup {
            background: var(--cyan-accent); color: white; font-weight: 800; font-size: 11px;
            padding: 12px 30px; border-radius: 2px; border: none; transition: 0.3s;
        }
        .btn-startup:hover { background: var(--navy-deep); transform: translateY(-2px); color: white; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="dash-container">
        <div class="container">
            <div class="row g-4">
                <div class="col-lg-3" data-aos="fade-right">
                    <div class="dash-sidebar">
                        <div class="text-center mb-5">
                            <h6 class="fw-bold mt-3 mb-1"><asp:Label ID="lblHeaderName" runat="server" Text="Student Name"></asp:Label></h6>
                            <p class="text-muted small mb-0"><asp:Label ID="lblHeaderEmail" runat="server"></asp:Label></p>
                        </div>
                        <nav>
                            <a href="studentdashboard.aspx" class="sidebar-link active"><i class="fas fa-th-large"></i> Overview</a>
                            <a href="learnit.aspx" class="sidebar-link"><i class="fas fa-book"></i> My Tutorials</a>
                            <a href="errors.aspx" class="sidebar-link"><i class="fas fa-bug"></i> Bug Solutions</a>
                            <asp:LinkButton ID="btnLogout" runat="server" OnClick="btnLogout_Click" CssClass="sidebar-link text-danger border-0"><i class="fas fa-power-off"></i> Sign Out</asp:LinkButton>
                        </nav>
                    </div>
                </div>

                <div class="col-lg-9">
                    <div class="d-flex justify-content-between align-items-center mb-5" data-aos="fade-down">
                        <div>
                            <span class="text-uppercase small fw-bold text-info" style="letter-spacing:2px;">Student Portal</span>
                            <h2 class="fw-bold mt-1">Hello, <asp:Literal ID="litFirstName" runat="server"></asp:Literal>!</h2>
                        </div>
                        <button type="button" class="btn btn-outline-dark btn-sm fw-bold px-4 rounded-0" data-bs-toggle="modal" data-bs-target="#editProfileModal">
                            <i class="fas fa-cog me-2"></i> ACCOUNT SETTINGS
                        </button>
                    </div>

                    <div class="dash-card bg-dark text-white shadow-lg" data-aos="fade-up">
                        <div class="row align-items-center">
                            <div class="col-md-8">
                                <h5 class="fw-bold mb-2">Need Technical Guidance?</h5>
                                <p class="small text-white-50 mb-0">Tutorials ya projects se juda koi bhi sawal ho, humari team se direct contact karein.</p>
                            </div>
                            <div class="col-md-4 text-md-end mt-3 mt-md-0">
                                <a href="contact.aspx" class="btn btn-startup">ASK A QUESTION</a>
                            </div>
                        </div>
                    </div>

                    <div class="dash-card" data-aos="fade-up" data-aos-delay="100">
                        <h5 class="section-title">Inquiry History</h5>
                        <div class="table-responsive mt-4">
                            <asp:GridView ID="gvMyMessages" runat="server" AutoGenerateColumns="False" CssClass="table table-premium" GridLines="None">
                                <Columns>
                                    <asp:BoundField DataField="Subject" HeaderText="Topic" />
                                    <asp:TemplateField HeaderText="Sent Date">
                                        <ItemTemplate>
                                            <span class="text-muted small fw-bold">
                                                <i class="far fa-calendar-alt me-1"></i>
                                                <%# Eval("SentDate") != DBNull.Value ? Convert.ToDateTime(Eval("SentDate")).ToString("dd MMM yyyy") : "N/A" %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Status">
                                        <ItemTemplate>
                                            <span class='<%# (Eval("IsReplied") != DBNull.Value && Convert.ToBoolean(Eval("IsReplied"))) ? "badge-replied" : "badge-waiting" %>'>
                                                <%# (Eval("IsReplied") != DBNull.Value && Convert.ToBoolean(Eval("IsReplied"))) ? "RESOLVED" : "PENDING" %>
                                            </span>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Response">
                                        <ItemTemplate>
                                            <div class="small text-muted" style="max-width:250px;">
                                                <%# Eval("AdminReply") != DBNull.Value ? Eval("AdminReply").ToString() : "<i>Awaiting feedback...</i>" %>
                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </asp:GridView>
                        </div>
                        <asp:Panel ID="pnlNoMessages" runat="server" Visible="false" CssClass="text-center py-5">
                            <i class="fas fa-inbox fa-3x mb-3 opacity-25"></i>
                            <p class="text-muted small fw-bold">No active inquiries found.</p>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="editProfileModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content rounded-0 border-0 shadow-lg">
                <div class="modal-header bg-dark text-white rounded-0">
                    <h6 class="modal-title fw-bold">UPDATE PROFILE</h6>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body p-5">
                    <div class="mb-4">
                        <label class="small fw-bold text-uppercase text-muted" style="font-size:10px;">Full Name</label>
                        <asp:TextBox ID="txtName" runat="server" CssClass="form-control rounded-0 border-0 border-bottom"></asp:TextBox>
                    </div>
                    <div class="mb-5">
                        <label class="small fw-bold text-uppercase text-muted" style="font-size:10px;">Mobile Number</label>
                        <asp:TextBox ID="txtMobile" runat="server" CssClass="form-control rounded-0 border-0 border-bottom"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnUpdateProfile" runat="server" Text="SAVE CHANGES" OnClick="btnUpdateProfile_Click" CssClass="btn btn-startup w-100 py-3" />
                </div>
            </div>
        </div>
    </div>

    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>AOS.init({ duration: 1000, once: true });</script>
</asp:Content>