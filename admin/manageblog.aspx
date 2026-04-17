<%@ Page Title="Manage Blogs - ITDuniya" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="manageblog.aspx.cs" Inherits="admin_manageblog" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <style>
        /* Compact Styling to reduce scroll */
        .admin-card { background: #fff; border: 1px solid #e5e7eb; border-radius: 8px; }
        
        /* Tab Styling */
        .nav-tabs .nav-link { color: #6b7280; font-weight: 600; border: none; padding: 12px 20px; }
        .nav-tabs .nav-link.active { color: var(--accent-color); border-bottom: 3px solid var(--accent-color); background: transparent; }

        /* Fixed Height Grid for less scrolling */
        .grid-container {
            max-height: 500px; /* Table ki height fix kar di */
            overflow-y: auto;
            border-radius: 0 0 8px 8px;
        }

        .form-label-custom { font-size: 13px; font-weight: 600; color: #374151; margin-bottom: 5px; display: block; }
        .input-custom { border-radius: 6px; padding: 8px 12px; border: 1px solid #d1d5db; font-size: 14px; }
        
        /* Modern Grid */
        .modern-grid th { position: sticky; top: 0; background: #f9fafb !important; z-index: 10; }
        .modern-grid td { font-size: 13px; padding: 10px !important; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="mb-4">
        <h3 class="fw-bold text-dark m-0">Blog Manager</h3>
    </div>
    
    <asp:HiddenField ID="hfBlogID" runat="server" />

    <ul class="nav nav-tabs mb-4" id="blogTabs" role="tablist">
        <li class="nav-item">
            <button class="nav-link active" id="edit-tab" data-bs-toggle="tab" data-bs-target="#edit-pane" type="button">
                <i class="fas fa-plus-circle me-2"></i>Add / Edit Post
            </button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id="history-tab" data-bs-toggle="tab" data-bs-target="#history-pane" type="button">
                <i class="fas fa-history me-2"></i>Post History
            </button>
        </li>
    </ul>

    <div class="tab-content" id="blogTabsContent">
        <div class="tab-pane fade show active" id="edit-pane" role="tabpanel">
            <div class="admin-card shadow-sm p-4">
                <div class="row g-3">
                    <div class="col-md-8">
                        <label class="form-label-custom">Article Title</label>
                        <asp:TextBox ID="txtBlogTitle" runat="server" CssClass="form-control input-custom" placeholder="Catchy title..."></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label-custom">Theme</label>
                        <asp:TextBox ID="txtTheme" runat="server" CssClass="form-control input-custom" placeholder="e.g. MERN Stack"></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label class="form-label-custom">Content</label>
                        <asp:TextBox ID="txtBlogContent" runat="server" TextMode="MultiLine" Rows="6" CssClass="form-control input-custom"></asp:TextBox>
                    </div>
                    <div class="col-12 pt-2">
                        <asp:Button ID="btnSaveBlog" runat="server" Text="Save Post" OnClick="btnSaveBlog_Click" CssClass="btn btn-info text-white px-4 fw-bold" style="background:var(--accent-color); border:none;" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" CssClass="btn btn-light ms-2" Visible="false" />
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="history-pane" role="tabpanel">
            <div class="admin-card shadow-sm overflow-hidden">
                <div class="grid-container">
                    <asp:GridView ID="gvBlogs" runat="server" AutoGenerateColumns="False" 
                        CssClass="table modern-grid mb-0" DataKeyNames="BlogID" 
                        OnRowDeleting="gvBlogs_RowDeleting" OnRowCommand="gvBlogs_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="Title" HeaderText="Title" ItemStyle-CssClass="fw-bold" />
                            <asp:TemplateField HeaderText="Theme">
                                <ItemTemplate>
                                    <span class="badge bg-light text-dark border"><%# Eval("Theme") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="PostDate" HeaderText="Date" DataFormatString="{0:dd MMM}" />
                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-end">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditBlog" CommandArgument='<%# Eval("BlogID") %>' CssClass="text-primary me-2"><i class="fas fa-edit"></i></asp:LinkButton>
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="text-danger" OnClientClick="return confirm('Delete?');"><i class="fas fa-trash-alt"></i></asp:LinkButton>
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
            // CKEditor height thodi kam ki gayi hai scroll bachane ke liye
            CKEDITOR.replace('<%= txtBlogContent.ClientID %>', {
                height: 300,
                removeButtons: 'About,Maximize',
                uiColor: '#ffffff'
            });

            // Agar Edit mode hai (hfBlogID empty nahi hai), toh entry tab dikhao
            var blogId = document.getElementById('<%= hfBlogID.ClientID %>').value;
            if (blogId != "") {
                var triggerEl = document.querySelector('#blogTabs button[id="edit-tab"]');
                bootstrap.Tab.getInstance(triggerEl).show();
            }
        };
    </script>
</asp:Content>