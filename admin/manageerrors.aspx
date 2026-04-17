<%@ Page Title="Manage Errors - ITDuniya" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="manageerrors.aspx.cs" Inherits="admin_manageerrors" ValidateRequest="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="https://cdn.ckeditor.com/4.22.1/standard/ckeditor.js"></script>
    <style>
        .admin-card { background: #fff; border: 1px solid #e5e7eb; border-radius: 12px; }
        
        /* Tab Styling */
        .nav-tabs .nav-link { color: #6b7280; font-weight: 600; border: none; padding: 12px 20px; transition: 0.3s; }
        .nav-tabs .nav-link.active { color: var(--accent-color); border-bottom: 3px solid var(--accent-color); background: transparent; }

        /* Form Styling */
        .form-label-custom { font-size: 13px; font-weight: 700; color: #374151; margin-bottom: 6px; display: block; }
        .input-custom { border-radius: 8px; padding: 10px 14px; border: 1px solid #d1d5db; font-size: 14px; transition: 0.3s; }
        .input-custom:focus { border-color: var(--accent-color); box-shadow: 0 0 0 4px rgba(0, 196, 204, 0.1); outline: none; }

        /* GridView Modern Styling */
        .grid-container { max-height: 550px; overflow-y: auto; }
        .modern-grid th { position: sticky; top: 0; background: #f9fafb !important; z-index: 10; font-size: 11px; text-transform: uppercase; letter-spacing: 0.5px; padding: 15px !important; border-bottom: 1px solid #eee !important; }
        .modern-grid td { font-size: 13.5px; padding: 12px 15px !important; vertical-align: middle; border-bottom: 1px solid #f3f4f6 !important; }
        
        /* Severity Badges */
        .sev-high { color: #ef4444; font-weight: 700; }
        .sev-medium { color: #f59e0b; font-weight: 700; }
        .sev-low { color: #10b981; font-weight: 700; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark m-0"><i class="fas fa-bug-slash text-warning me-2"></i>Error Solutions Lab</h3>
            <p class="text-muted small m-0">Log and resolve technical exceptions for the community.</p>
        </div>
        <asp:Label ID="lblMsg" runat="server" CssClass="badge bg-light text-dark border p-2"></asp:Label>
    </div>

    <asp:HiddenField ID="hfErrorID" runat="server" />

    <ul class="nav nav-tabs mb-4" id="errorTabs" role="tablist">
        <li class="nav-item">
            <button class="nav-link active" id="log-tab" data-bs-toggle="tab" data-bs-target="#log-pane" type="button">
                <i class="fas fa-plus-circle me-2"></i>Log Error
            </button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id="db-tab" data-bs-toggle="tab" data-bs-target="#db-pane" type="button">
                <i class="fas fa-database me-2"></i>Error Database
            </button>
        </li>
    </ul>

    <div class="tab-content" id="errorTabsContent">
        <div class="tab-pane fade show active" id="log-pane" role="tabpanel">
            <div class="admin-card shadow-sm p-4">
                <div class="row g-3">
                    <div class="col-md-8">
                        <label class="form-label-custom">Error Title / Exception Name</label>
                        <asp:TextBox ID="txtErrorTitle" runat="server" CssClass="form-control input-custom" placeholder="e.g. NullReferenceException in .NET"></asp:TextBox>
                    </div>
                    <div class="col-md-4">
                        <label class="form-label-custom">Technology</label>
                        <asp:DropDownList ID="ddlTech" runat="server" CssClass="form-select input-custom">
                            <asp:ListItem Value="">-- Select --</asp:ListItem>
                            <asp:ListItem>ASP.NET (Web Forms/Core/MVC)</asp:ListItem>
                            <asp:ListItem>React.js / Next.js</asp:ListItem>
                            <asp:ListItem>Node.js / Express.js</asp:ListItem>
                            <asp:ListItem>Python (Django / Flask)</asp:ListItem>
                            <asp:ListItem>SQL Server / NoSQL</asp:ListItem>
                            <asp:ListItem>C / C++ / C#</asp:ListItem>
                            <asp:ListItem>Graphics: Photoshop / CorelDRAW</asp:ListItem>
                            <asp:ListItem>General IT / Networking</asp:ListItem>
                            <asp:ListItem>Other</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label-custom">Severity Level</label>
                        <asp:DropDownList ID="ddlSeverity" runat="server" CssClass="form-select input-custom">
                            <asp:ListItem Value="Low">Low (Minor/UI)</asp:ListItem>
                            <asp:ListItem Value="Medium" Selected="True">Medium (Functional)</asp:ListItem>
                            <asp:ListItem Value="High">High (Critical/System Crash)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label-custom">Work Status</label>
                        <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-select input-custom">
                            <asp:ListItem Value="Open">Open (New)</asp:ListItem>
                            <asp:ListItem Value="In-Progress">In-Progress</asp:ListItem>
                            <asp:ListItem Value="Resolved">Resolved (Fixed)</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-12">
                        <label class="form-label-custom">Primary Cause</label>
                        <asp:TextBox ID="txtCause" runat="server" TextMode="MultiLine" Rows="2" CssClass="form-control input-custom" placeholder="Briefly explain why this happens..."></asp:TextBox>
                    </div>
                    <div class="col-12">
                        <label class="form-label-custom">Detailed Solution (Code & Explanation)</label>
                        <asp:TextBox ID="txtSolution" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </div>
                    <div class="col-12 pt-2 text-end">
                        <asp:Button ID="btnCancel" runat="server" Text="Discard" OnClick="btnCancel_Click" CssClass="btn btn-light px-4 me-2 fw-semibold" Visible="false" />
                        <asp:Button ID="btnSaveError" runat="server" Text="Save Solution" OnClick="btnSaveError_Click" CssClass="btn btn-warning px-5 fw-bold text-white" style="background:var(--accent-color); border:none; border-radius:8px;" />
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="db-pane" role="tabpanel">
            <div class="admin-card shadow-sm overflow-hidden">
                <div class="grid-container">
                    <asp:GridView ID="gvErrors" runat="server" AutoGenerateColumns="False" 
                        CssClass="table modern-grid mb-0" DataKeyNames="ErrorID" 
                        OnRowDeleting="gvErrors_RowDeleting" OnRowCommand="gvErrors_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="ErrorTitle" HeaderText="Error Exception" ItemStyle-CssClass="fw-bold text-dark ps-4" HeaderStyle-CssClass="ps-4" />
                            <asp:BoundField DataField="Technology" HeaderText="Tech Stack" />
                            <asp:TemplateField HeaderText="Severity">
                                <ItemTemplate>
                                    <span class='<%# Eval("Severity").ToString() == "High" ? "sev-high" : (Eval("Severity").ToString() == "Medium" ? "sev-medium" : "sev-low") %>'>
                                        <i class="fas fa-circle me-1" style="font-size:8px;"></i><%# Eval("Severity") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Status">
                                <ItemTemplate>
                                    <span class='badge <%# Eval("Status").ToString() == "Open" ? "bg-danger" : (Eval("Status").ToString() == "In-Progress" ? "bg-warning text-dark" : "bg-success") %> px-2 py-1'>
                                        <%# Eval("Status") %>
                                    </span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-end pe-4" HeaderStyle-CssClass="text-end pe-4">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" CommandName="EditError" CommandArgument='<%# Eval("ErrorID") %>' CssClass="text-primary me-3"><i class="fas fa-edit"></i></asp:LinkButton>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="text-danger" OnClientClick="return confirm('Delete record?');"><i class="fas fa-trash-alt"></i></asp:LinkButton>
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
            CKEDITOR.replace('<%= txtSolution.ClientID %>', {
                height: 350,
                removeButtons: 'About',
                uiColor: '#ffffff'
            });

            // Sync tab focus on Edit
            var errId = document.getElementById('<%= hfErrorID.ClientID %>').value;
            if (errId != "") {
                var triggerEl = document.querySelector('#errorTabs button[id="log-tab"]');
                bootstrap.Tab.getInstance(triggerEl).show();
            }
        };
    </script>
</asp:Content>