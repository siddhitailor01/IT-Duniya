<%@ Page Title="Manage Categories - ITDuniya" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="managecategories.aspx.cs" Inherits="admin_managecategories" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        /* Compact Admin Card */
        .admin-card { background: #fff; border: 1px solid #e5e7eb; border-radius: 8px; }
        
        /* Tab Styling */
        .nav-tabs .nav-link { color: #6b7280; font-weight: 600; border: none; padding: 12px 20px; transition: 0.3s; }
        .nav-tabs .nav-link.active { color: var(--accent-color); border-bottom: 3px solid var(--accent-color); background: transparent; }

        /* Icon Preview Box */
        .icon-preview-box { 
            height: 45px; width: 45px; background: #f9fafb; 
            display: flex; align-items: center; justify-content: center; 
            border: 1px solid #d1d5db; border-radius: 8px; color: var(--accent-color);
        }

        /* Fixed Height Grid for history */
        .grid-container {
            max-height: 450px; 
            overflow-y: auto;
        }

        .form-label-custom { font-size: 13px; font-weight: 700; color: #374151; margin-bottom: 6px; display: block; }
        .input-custom { border-radius: 8px; padding: 10px 14px; border: 1px solid #d1d5db; font-size: 14px; transition: 0.3s; }
        .input-custom:focus { border-color: var(--accent-color); box-shadow: 0 0 0 4px rgba(0, 196, 204, 0.1); outline: none; }

        /* Modern Grid Styling */
        .modern-grid th { position: sticky; top: 0; background: #f9fafb !important; z-index: 10; font-size: 11px; text-transform: uppercase; letter-spacing: 0.5px; padding: 15px !important; }
        .modern-grid td { font-size: 14px; padding: 12px 15px !important; vertical-align: middle; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark m-0">Learning Categories</h3>
            <p class="text-muted small m-0">Manage technology modules and homepage icons.</p>
        </div>
    </div>

    <ul class="nav nav-tabs mb-4" id="catTabs" role="tablist">
        <li class="nav-item">
            <button class="nav-link active" id="add-tab" data-bs-toggle="tab" data-bs-target="#add-pane" type="button">
                <i class="fas fa-plus-circle me-2"></i>New Category
            </button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id="view-tab" data-bs-toggle="tab" data-bs-target="#view-pane" type="button">
                <i class="fas fa-th-list me-2"></i>Active Categories
            </button>
        </li>
    </ul>

    <div class="tab-content" id="catTabsContent">
        <div class="tab-pane fade show active" id="add-pane" role="tabpanel">
            <div class="admin-card shadow-sm p-4">
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label-custom">Category Name</label>
                        <asp:TextBox ID="txtCatName" runat="server" CssClass="form-control input-custom" placeholder="e.g. Web Development"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label-custom">Icon Class (FontAwesome)</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light"><i class="fas fa-code"></i></span>
                            <asp:TextBox ID="txtIcon" runat="server" CssClass="form-control input-custom" placeholder="e.g. fa-laptop-code"></asp:TextBox>
                        </div>
                        <small class="text-muted mt-1 d-block" style="font-size: 11px;">Visit <b>fontawesome.com</b> to find icon classes.</small>
                    </div>
                    <div class="col-12">
                        <label class="form-label-custom">Short Description</label>
                        <asp:TextBox ID="txtDesc" runat="server" CssClass="form-control input-custom" TextMode="MultiLine" Rows="3" placeholder="Homepage card par dikhne wala chota intro..."></asp:TextBox>
                    </div>
                    <div class="col-12 pt-2">
                        <asp:Button ID="btnSaveCat" runat="server" Text="Save Category" OnClick="btnSaveCat_Click" CssClass="btn btn-info text-white px-5 fw-bold" style="background:var(--accent-color); border:none; border-radius: 8px; padding: 12px 30px;" />
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="view-pane" role="tabpanel">
            <div class="admin-card shadow-sm overflow-hidden">
                <div class="grid-container">
                    <asp:GridView ID="gvCategories" runat="server" AutoGenerateColumns="False" 
                        CssClass="table modern-grid mb-0" DataKeyNames="CategoryID" 
                        OnRowDeleting="gvCategories_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Icon" ItemStyle-Width="80px">
                                <ItemTemplate>
                                    <div class="icon-preview-box">
                                        <i class="fa <%# Eval("IconClass") %> fa-lg"></i>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="CategoryName" HeaderText="Module Name" ItemStyle-CssClass="fw-bold text-dark" />
                            <asp:BoundField DataField="ShortDesc" HeaderText="Description Snippet" ItemStyle-CssClass="text-muted" />
                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-end pe-4" HeaderStyle-CssClass="text-end pe-4">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="btn btn-sm btn-outline-danger border-0" OnClientClick="return confirm('Confirm Delete?');">
                                        <i class="fas fa-trash-alt"></i>
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>