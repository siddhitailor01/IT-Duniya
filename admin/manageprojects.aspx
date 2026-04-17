<%@ Page Title="Manage Projects - ITDuniya" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="manageprojects.aspx.cs" Inherits="admin_manageprojects" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <style>
        .admin-card { background: #fff; border: 1px solid #e5e7eb; border-radius: 12px; }
        
        /* Tab Styling */
        .nav-tabs .nav-link { color: #6b7280; font-weight: 600; border: none; padding: 12px 20px; transition: 0.3s; }
        .nav-tabs .nav-link.active { color: var(--accent-color); border-bottom: 3px solid var(--accent-color); background: transparent; }

        /* Form Controls */
        .form-label-custom { font-size: 13px; font-weight: 700; color: #374151; margin-bottom: 6px; display: block; }
        .input-custom { border-radius: 8px; padding: 10px 14px; border: 1px solid #d1d5db; font-size: 14px; transition: 0.3s; }
        .input-custom:focus { border-color: var(--accent-color); box-shadow: 0 0 0 4px rgba(0, 196, 204, 0.1); outline: none; }

        /* Compact Grid Styling */
        .grid-container { max-height: 500px; overflow-y: auto; }
        .modern-grid th { position: sticky; top: 0; background: #f9fafb !important; z-index: 10; font-size: 11px; text-transform: uppercase; letter-spacing: 0.5px; padding: 15px !important; border-bottom: 1px solid #eee !important; }
        .modern-grid td { font-size: 14px; padding: 12px 15px !important; vertical-align: middle; border-bottom: 1px solid #f3f4f6 !important; }

        /* Project Preview Img */
        .proj-thumb-preview { width: 70px; height: 45px; object-fit: cover; border-radius: 6px; border: 1px solid #eee; }
        
        /* Level Badges */
        .badge-beginner { background: #ecfdf5; color: #059669; border: 1px solid #10b981; }
        .badge-intermediate { background: #fffbeb; color: #d97706; border: 1px solid #f59e0b; }
        .badge-advanced { background: #fef2f2; color: #dc2626; border: 1px solid #ef4444; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark m-0"><i class="fas fa-laptop-code text-success me-2"></i>Project Showcase</h3>
            <p class="text-muted small m-0">Upload and manage real-world projects for students.</p>
        </div>
    </div>

    <asp:HiddenField ID="hfProjectID" runat="server" />

    <ul class="nav nav-tabs mb-4" id="projTabs" role="tablist">
        <li class="nav-item">
            <button class="nav-link active" id="add-tab" data-bs-toggle="tab" data-bs-target="#add-pane" type="button">
                <i class="fas fa-folder-plus me-2"></i>Post Project
            </button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id="list-tab" data-bs-toggle="tab" data-bs-target="#list-pane" type="button">
                <i class="fas fa-briefcase me-2"></i>Project Library
            </button>
        </li>
    </ul>

    <div class="tab-content" id="projTabsContent">
        <div class="tab-pane fade show active" id="add-pane" role="tabpanel">
            <div class="admin-card shadow-sm p-4">
                <div class="row g-3">
                    <div class="col-md-6">
                        <label class="form-label-custom">Project Title</label>
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control input-custom" placeholder="e.g. E-commerce Website using MERN"></asp:TextBox>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label-custom">Difficulty Level</label>
                        <asp:DropDownList ID="ddlLevel" runat="server" CssClass="form-select input-custom">
                            <asp:ListItem>Beginner</asp:ListItem>
                            <asp:ListItem Selected="True">Intermediate</asp:ListItem>
                            <asp:ListItem>Advanced</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-3">
                        <label class="form-label-custom">Tech Stack (Keywords)</label>
                        <asp:TextBox ID="txtTech" runat="server" CssClass="form-control input-custom" placeholder="React, Node, MongoDB"></asp:TextBox>
                    </div>
                    
                    <div class="col-12">
                        <label class="form-label-custom">Project Overview & Features</label>
                        <asp:TextBox ID="txtDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>

                    <div class="col-md-6">
                        <label class="form-label-custom">Project Thumbnail</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light"><i class="fas fa-cloud-upload-alt text-muted"></i></span>
                            <asp:FileUpload ID="fuThumb" runat="server" CssClass="form-control input-custom" />
                        </div>
                        <small class="text-muted mt-1 d-block">Recommended size: 800x600 px.</small>
                    </div>

                    <div class="col-12 pt-3 text-end">
                        <asp:Button ID="btnCancel" runat="server" Text="Discard" OnClick="btnCancel_Click" CssClass="btn btn-light px-4 me-2 fw-semibold" Visible="false" />
                        <asp:Button ID="btnSave" runat="server" Text="Save Project" OnClick="btnSave_Click" CssClass="btn btn-success px-5 fw-bold text-white shadow-sm" style="background:var(--accent-color); border:none; border-radius:8px; padding: 12px 30px;" />
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="list-pane" role="tabpanel">
            <div class="admin-card shadow-sm overflow-hidden">
                <div class="grid-container">
                    <asp:GridView ID="gvProjects" runat="server" AutoGenerateColumns="False" 
                        CssClass="table modern-grid mb-0" DataKeyNames="ProjectID" 
                        OnRowDeleting="gvProjects_RowDeleting" OnRowCommand="gvProjects_RowCommand">
                        <Columns>
                            <asp:TemplateField HeaderText="Preview" ItemStyle-Width="100px">
                                <ItemTemplate>
                                    <img src='img/projects/<%# Eval("Thumbnail") %>' class="proj-thumb-preview shadow-sm" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Title" HeaderText="Project Name" ItemStyle-CssClass="fw-bold text-dark" />
                            <asp:TemplateField HeaderText="Level">
                                <ItemTemplate>
                                    
                                    <span class='badge px-2 py-1 <%# Eval("Level").ToString() == "Beginner" ? "badge-beginner" : (Eval("Level").ToString() == "Intermediate" ? "badge-intermediate" : "badge-advanced") %>'>
                                        <%# Eval("Level") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-end pe-4" HeaderStyle-CssClass="text-end pe-4">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditProject" CommandArgument='<%# Eval("ProjectID") %>' CssClass="text-primary me-3"><i class="fas fa-edit"></i></asp:LinkButton>
                                    <asp:LinkButton ID="btnDel" runat="server" CommandName="Delete" CssClass="text-danger" OnClientClick="return confirm('Pakka delete karein?');"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        window.onload = function () {
            CKEDITOR.replace('<%= txtDesc.ClientID %>', {
                height: 350,
                removeButtons: 'About',
                uiColor: '#ffffff'
            });

            // Automatic Tab Switch on Edit Mode
            var projId = document.getElementById('<%= hfProjectID.ClientID %>').value;
            if (projId != "") {
                var triggerEl = document.querySelector('#projTabs button[id="add-tab"]');
                bootstrap.Tab.getInstance(triggerEl).show();
            }
        };
    </script>
</asp:Content>