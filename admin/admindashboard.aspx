<%@ Page Title="Admin Dashboard - ITDuniya" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="admindashboard.aspx.cs" Inherits="admin_admindashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        :root {
            --blue-gradient: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            --green-gradient: linear-gradient(135deg, #2af598 0%, #009efd 100%);
            --orange-gradient: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
            --red-gradient: linear-gradient(135deg, #ff0844 0%, #ffb199 100%);
        }

        /* Compact Stat Cards */
        .stat-card {
            border: none;
            border-radius: 12px;
            transition: all 0.3s ease;
            color: white;
            position: relative;
            overflow: hidden;
            min-height: 100px; /* Height kam kar di gayi hai */
        }

        .stat-card:hover { transform: translateY(-5px); }

        .bg-tutorial { background: var(--blue-gradient); }
        .bg-project { background: var(--green-gradient); }
        .bg-error { background: var(--orange-gradient); }
        .bg-message { background: var(--red-gradient); }

        .card-icon-bg {
            font-size: 2.5rem; /* Icon size chota kiya gaya hai */
            opacity: 0.15;
            position: absolute;
            right: 10px;
            bottom: 10px;
        }

        .welcome-banner {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            border-left: 5px solid var(--accent-color);
            margin-bottom: 25px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.02);
        }

        /* Quick Action Boxes */
        .quick-action-card {
            background: #fff;
            border: 1px solid #eee;
            border-radius: 10px;
            padding: 15px;
            text-align: center;
            text-decoration: none !important;
            transition: 0.3s;
            display: block;
            height: 100%;
        }

        .quick-action-card:hover {
            border-color: var(--accent-color);
            background: #f8fafc;
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(0,0,0,0.05);
        }

        .quick-action-card i {
            font-size: 1.5rem;
            margin-bottom: 8px;
            display: block;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="container-fluid">
        <div class="welcome-banner d-flex justify-content-between align-items-center">
            <div>
                <h4 class="fw-bold text-dark m-0">Control Center 👋</h4>
                <p class="text-muted m-0 small">Website status at a glance.</p>
            </div>
            <div class="text-end d-none d-md-block">
                <span class="badge bg-light text-dark border p-2"><i class="far fa-calendar-alt me-2"></i><%= DateTime.Now.ToString("dd MMM, yyyy") %></span>
            </div>
        </div>

        <div class="row g-3 mb-4">
            <div class="col-xl-3 col-md-6">
                <div class="card stat-card bg-tutorial">
                    <div class="card-body p-3">
                        <h6 class="text-uppercase fw-bold opacity-75 small mb-1">Tutorials</h6>
                        <h3 class="fw-bold m-0"><asp:Literal ID="litTotalTutorials" runat="server"></asp:Literal></h3>
                        <i class="fas fa-book card-icon-bg"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card stat-card bg-project">
                    <div class="card-body p-3">
                        <h6 class="text-uppercase fw-bold opacity-75 small mb-1">Projects</h6>
                        <h3 class="fw-bold m-0"><asp:Literal ID="litTotalProjects" runat="server"></asp:Literal></h3>
                        <i class="fas fa-project-diagram card-icon-bg"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card stat-card bg-error">
                    <div class="card-body p-3">
                        <h6 class="text-uppercase fw-bold opacity-75 small mb-1">Errors</h6>
                        <h3 class="fw-bold m-0"><asp:Literal ID="litTotalErrors" runat="server"></asp:Literal></h3>
                        <i class="fas fa-bug card-icon-bg"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card stat-card" style="background: linear-gradient(135deg, #6e8efb 0%, #a777e3 100%);">
                    <div class="card-body p-3">
                        <h6 class="text-uppercase fw-bold opacity-75 small mb-1">Blogs</h6>
                        <h3 class="fw-bold m-0"><asp:Literal ID="litTotalBlogs" runat="server"></asp:Literal></h3>
                        <i class="fas fa-newspaper card-icon-bg"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="row g-3 mb-5">
            <div class="col-xl-4 col-md-6">
                <div class="card stat-card shadow-sm" style="background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);">
                    <div class="card-body p-3">
                        <h6 class="text-uppercase fw-bold opacity-75 small mb-1">PDF Notes</h6>
                        <h3 class="fw-bold m-0"><asp:Literal ID="litTotalNotes" runat="server"></asp:Literal></h3>
                        <i class="fas fa-file-pdf card-icon-bg"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-6">
                <div class="card stat-card shadow-sm" style="background: linear-gradient(135deg, #FF512F 0%, #DD2476 100%);">
                    <div class="card-body p-3">
                        <h6 class="text-uppercase fw-bold opacity-75 small">Modules</h6>
                        <h3 class="fw-bold m-0"><asp:Literal ID="litTotalCategories" runat="server"></asp:Literal></h3>
                        <i class="fas fa-list card-icon-bg"></i>
                    </div>
                </div>
            </div>
            <div class="col-xl-4 col-md-12">
                <div class="card stat-card bg-message shadow-sm">
                    <div class="card-body p-3">
                        <h6 class="text-uppercase fw-bold opacity-75 small">Messages</h6>
                        <h3 class="fw-bold m-0"><asp:Literal ID="litTotalUserMessages" runat="server"></asp:Literal></h3>
                        <i class="fas fa-comments card-icon-bg"></i>
                    </div>
                </div>
            </div>
        </div>

        <div class="card border-0 shadow-sm" style="border-radius:12px;">
            <div class="card-header bg-white py-3">
                <h6 class="m-0 fw-bold text-dark"><i class="fas fa-rocket text-primary me-2"></i>Quick Management</h6>
            </div>
            <div class="card-body p-4">
                <div class="row g-3">
                    <div class="col-6 col-lg-2">
                        <a href="ManageLearnIT.aspx" class="quick-action-card">
                            <i class="fas fa-plus text-primary"></i>
                            <span class="small fw-bold text-dark">Tutorial</span>
                        </a>
                    </div>
                    <div class="col-6 col-lg-2">
                        <a href="ManageProjects.aspx" class="quick-action-card">
                            <i class="fas fa-code text-success"></i>
                            <span class="small fw-bold text-dark">Project</span>
                        </a>
                    </div>
                    <div class="col-6 col-lg-2">
                        <a href="ManageErrors.aspx" class="quick-action-card">
                            <i class="fas fa-tools text-warning"></i>
                            <span class="small fw-bold text-dark">Error</span>
                        </a>
                    </div>
                    <div class="col-6 col-lg-2">
                        <a href="ManageBlog.aspx" class="quick-action-card">
                            <i class="fas fa-pen text-info"></i>
                            <span class="small fw-bold text-dark">Blog</span>
                        </a>
                    </div>
                    <div class="col-6 col-lg-2">
                        <a href="UploadNotes.aspx" class="quick-action-card">
                            <i class="fas fa-file-upload text-secondary"></i>
                            <span class="small fw-bold text-dark">Upload PDF</span>
                        </a>
                    </div>
                    <div class="col-6 col-lg-2">
                        <a href="ViewMessages.aspx" class="quick-action-card">
                            <i class="fas fa-envelope text-danger"></i>
                            <span class="small fw-bold text-dark">Messages</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>