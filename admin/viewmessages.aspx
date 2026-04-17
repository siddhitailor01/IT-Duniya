<%@ Page Title="Messages - ITDuniya" Language="C#" MasterPageFile="~/admin/adminMasterPage.master" AutoEventWireup="true" CodeFile="viewmessages.aspx.cs" Inherits="admin_viewmessages" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .admin-card { background: #fff; border: 1px solid #e5e7eb; border-radius: 12px; }
        
        /* Modern Grid Styling */
        .modern-grid { border: none !important; width: 100%; }
        .modern-grid th { 
            background-color: #f9fafb !important; color: #4b5563 !important; 
            text-transform: uppercase; font-size: 11px; letter-spacing: 0.05em; 
            padding: 15px !important; border-bottom: 1px solid #e5e7eb !important; 
        }
        .modern-grid td { 
            padding: 15px !important; vertical-align: middle; 
            color: #1f2937; font-size: 14px; border-bottom: 1px solid #f3f4f6 !important; 
        }
        
        /* Message Preview */
        .msg-preview {
            max-width: 250px; color: #6b7280; font-size: 13px;
            overflow: hidden; text-overflow: ellipsis; white-space: nowrap;
        }

        /* Modal Customization */
        .modal-premium .modal-content { border-radius: 16px; border: none; overflow: hidden; }
        .modal-premium .modal-header { background: #111827; color: #fff; padding: 20px; }
        .modal-premium .modal-body { padding: 30px; }
        .reply-box { 
            border-radius: 10px; border: 1px solid #d1d5db; 
            padding: 12px; font-size: 14px; transition: 0.3s; 
        }
        .reply-box:focus { border-color: var(--accent-color); box-shadow: 0 0 0 4px rgba(0, 196, 204, 0.1); outline: none; }

        .btn-read { 
            font-size: 12px; font-weight: 700; color: var(--accent-color); 
            text-transform: uppercase; text-decoration: none; 
        }
        .btn-read:hover { color: #0891b2; }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <div class="d-flex align-items-center justify-content-between mb-4">
        <div>
            <h3 class="fw-bold text-dark m-0"><i class="fa-solid fa-inbox text-info me-2"></i>Communication Hub</h3>
            <p class="text-muted small m-0">Student queries aur feedbacks ko yahan se manage karein.</p>
        </div>
    </div>

    <div class="admin-card shadow-sm overflow-hidden">
        <div class="bg-light p-3 border-bottom d-flex justify-content-between align-items-center">
            <h6 class="m-0 fw-bold text-secondary"><i class="fa-solid fa-envelope-open-text me-2"></i>Recent Inquiries</h6>
        </div>
        
        <div class="table-responsive">
            <asp:GridView ID="gvMessages" runat="server" AutoGenerateColumns="False" 
                CssClass="table modern-grid mb-0" DataKeyNames="MsgID" 
                OnRowDeleting="gvMessages_RowDeleting">
                
                <Columns>
                    <asp:TemplateField HeaderStyle-CssClass="ps-4" ItemStyle-CssClass="ps-4">
                        <HeaderTemplate>Student Details</HeaderTemplate>
                        <ItemTemplate>
                            <div class="fw-bold text-dark"><%# Eval("SenderName") %></div>
                            <div class="text-muted small" style="font-size:11px;"><%# Eval("SenderEmail") %></div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="Subject" HeaderText="Subject" ItemStyle-CssClass="fw-semibold text-secondary" />
                    
                    <asp:TemplateField HeaderText="Message Snippet">
                        <ItemTemplate>
                            <div class="msg-preview"><%# Eval("Message") %></div>
                            <button type="button" class="btn-read border-0 bg-transparent p-0" 
                                data-bs-toggle="modal" data-bs-target='#m_<%# Eval("MsgID") %>'>
                                <i class="fas fa-expand-alt me-1"></i> Full View & Reply
                            </button>

                            <div class="modal fade modal-premium" id='m_<%# Eval("MsgID") %>' tabindex="-1" aria-hidden="true">
                                <div class="modal-dialog modal-dialog-centered modal-lg">
                                    <div class="modal-content shadow-lg">
                                        <div class="modal-header">
                                            <h5 class="modal-title fw-bold"><i class="fas fa-user-circle me-2"></i>Message from <%# Eval("SenderName") %></h5>
                                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                                        </div>
                                        <div class="modal-body">
                                            <div class="row g-4">
                                                <div class="col-md-12">
                                                    <h6 class="fw-bold text-info small text-uppercase">Conversation Context</h6>
                                                    <div class="p-3 bg-light rounded-3 border">
                                                        <p class="mb-1"><strong>Subject:</strong> <%# Eval("Subject") %></p>
                                                        <hr class="my-2" />
                                                        <p class="mb-0 text-dark" style="line-height:1.6;"><%# Eval("Message") %></p>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <h6 class="fw-bold text-success small text-uppercase">Direct Response</h6>
                                                    <asp:TextBox ID="txtReply" runat="server" TextMode="MultiLine" Rows="4" CssClass="form-control reply-box" placeholder="Aapka jawab yahan likhein..."></asp:TextBox>
                                                    <div class="mt-3 d-flex justify-content-between align-items-center">
                                                        <small class="text-muted"><i class="fas fa-info-circle me-1"></i>Student ko direct email notification jayegi.</small>
                                                        <asp:Button ID="btnSendReply" runat="server" Text="Send Reply Now" CssClass="btn btn-info text-white px-4 fw-bold" OnClick="btnSendReply_Click" CommandArgument='<%# Eval("MsgID") %>' style="background:var(--accent-color); border:none; border-radius:8px;" />
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:TemplateField>

                    <asp:BoundField DataField="SentDate" HeaderText="Received On" DataFormatString="{0:dd MMM yyyy}" />

                    <asp:TemplateField HeaderText="Actions" ItemStyle-CssClass="text-end pe-4" HeaderStyle-CssClass="text-end pe-4">
                        <ItemTemplate>
                            <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" 
                                CssClass="btn btn-sm btn-outline-danger border-0" OnClientClick="return confirm('Kya aap is message ko delete karna chahte hain?');">
                                <i class="fas fa-trash-alt"></i>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>

                <EmptyDataTemplate>
                    <div class="text-center p-5 text-muted">
                        <i class="fa-solid fa-face-smile fa-3x mb-3 text-light"></i>
                        <h5 class="fw-bold">No New Messages!</h5>
                        <p class="small">Jab students contact karenge, toh yahan list dikhegi.</p>
                    </div>
                </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </div>
</asp:Content>