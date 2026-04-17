<%@ Page Title="Upload Notes - ITDuniya" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="uploadnotes.aspx.cs" Inherits="admin_uploadnotes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .admin-card { background: #fff; border: 1px solid #e5e7eb; border-radius: 12px; }
        
        /* Tab Styling to match your Admin Panel */
        .nav-tabs .nav-link { color: #6b7280; font-weight: 600; border: none; padding: 12px 20px; transition: 0.3s; }
        .nav-tabs .nav-link.active { color: var(--accent-color); border-bottom: 3px solid var(--accent-color); background: transparent; }

        /* Form Controls */
        .form-label-custom { font-size: 13px; font-weight: 700; color: #374151; margin-bottom: 6px; display: block; }
        .input-custom { border-radius: 8px; padding: 10px 14px; border: 1px solid #d1d5db; font-size: 14px; transition: 0.3s; }
        .input-custom:focus { border-color: var(--accent-color); box-shadow: 0 0 0 4px rgba(0, 196, 204, 0.1); outline: none; }

        /* History Grid Styling */
        .grid-container { max-height: 480px; overflow-y: auto; }
        .modern-grid th { position: sticky; top: 0; background: #f9fafb !important; z-index: 10; font-size: 11px; text-transform: uppercase; letter-spacing: 0.5px; padding: 15px !important; }
        .modern-grid td { font-size: 14px; padding: 12px 15px !important; vertical-align: middle; border-bottom: 1px solid #f3f4f6 !important; }

        /* PDF Icon Preview */
        .pdf-icon-circle {
            height: 40px; width: 40px; background: #fef2f2; 
            color: #ef4444; border-radius: 8px; 
            display: flex; align-items: center; justify-content: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark m-0"><i class="fas fa-file-pdf text-danger me-2"></i>Resource Library</h3>
            <p class="text-muted small m-0">Distribute PDF notes and study materials to your students.</p>
        </div>
    </div>

    <ul class="nav nav-tabs mb-4" id="notesTabs" role="tablist">
        <li class="nav-item">
            <button class="nav-link active" id="upload-tab" data-bs-toggle="tab" data-bs-target="#upload-pane" type="button">
                <i class="fas fa-cloud-upload-alt me-2"></i>Upload New PDF
            </button>
        </li>
        <li class="nav-item">
            <button class="nav-link" id="library-tab" data-bs-toggle="tab" data-bs-target="#library-pane" type="button">
                <i class="fas fa-folder-open me-2"></i>Notes Library
            </button>
        </li>
    </ul>

    <div class="tab-content" id="notesTabsContent">
        <div class="tab-pane fade show active" id="upload-pane" role="tabpanel">
            <div class="admin-card shadow-sm p-4">
                <div class="row g-4">
                    <div class="col-md-6">
                        <label class="form-label-custom">Note/PDF Title</label>
                        <asp:TextBox ID="txtNoteTitle" runat="server" CssClass="form-control input-custom" placeholder="e.g. C++ Full Handbook 2026"></asp:TextBox>
                    </div>
                    <div class="col-md-6">
                        <label class="form-label-custom">Category</label>
                        <asp:DropDownList ID="ddlNoteCat" runat="server" CssClass="form-select input-custom">
                            <asp:ListItem>Subject-wise Notes</asp:ListItem>
                            <asp:ListItem>Exam PDFs</asp:ListItem>
                            <asp:ListItem>Interview Prep</asp:ListItem>
                            <asp:ListItem>Cheat-Sheets</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                    <div class="col-md-12">
                        <label class="form-label-custom">Select PDF Document</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light text-muted"><i class="fas fa-file-pdf"></i></span>
                            <asp:FileUpload ID="fuNote" runat="server" CssClass="form-control input-custom" />
                        </div>
                        <small class="text-muted mt-2 d-block"><i class="fas fa-info-circle me-1"></i>Only PDF files are allowed for better compatibility.</small>
                    </div>
                    <div class="col-md-12 pt-2">
                        <asp:Button ID="btnUploadNote" runat="server" Text="Publish Study Material" OnClick="btnUploadNote_Click" 
                            CssClass="btn btn-primary px-5 fw-bold shadow-sm" style="background:var(--accent-color); border:none; border-radius:8px; padding: 12px 30px;" />
                    </div>
                </div>
            </div>
        </div>

        <div class="tab-pane fade" id="library-pane" role="tabpanel">
            <div class="admin-card shadow-sm overflow-hidden">
                <div class="grid-container">
                    <asp:GridView ID="gvNotes" runat="server" AutoGenerateColumns="False" 
                        CssClass="table modern-grid mb-0" DataKeyNames="NoteID" 
                        OnRowDeleting="gvNotes_RowDeleting">
                        <Columns>
                            <asp:TemplateField HeaderText="Type" ItemStyle-Width="60px">
                                <ItemTemplate>
                                    <div class="pdf-icon-circle">
                                        <i class="fas fa-file-pdf"></i>
                                    </div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Title" HeaderText="Document Title" ItemStyle-CssClass="fw-bold text-dark ps-2" />
                            <asp:TemplateField HeaderText="Category">
                                <ItemTemplate>
                                    <span class="badge bg-light text-dark border px-2 py-1"><%# Eval("Category") %></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="UploadDate" HeaderText="Date" DataFormatString="{0:dd MMM yyyy}" />
                            <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-end pe-4" HeaderStyle-CssClass="text-end pe-4">
                                <ItemTemplate>
                                    <a href='docs/<%# Eval("FilePath") %>' target="_blank" class="text-info me-3 action-btn"><i class="fas fa-external-link-alt"></i></a>
                                    <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" CssClass="text-danger action-btn" OnClientClick="return confirm('Delete document?');">
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