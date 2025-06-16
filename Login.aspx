<%@ Page Language="VB" AutoEventWireup="false" CodeBehind="Login.aspx.vb" Inherits="YTLWebApplication.Login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>YTL Fleet Management - Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="robots" content="noindex, nofollow" />
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .login-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 15px 35px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 400px;
            margin: 20px;
        }
        
        .login-header {
            background: #465ae8;
            color: white;
            padding: 30px;
            text-align: center;
        }
        
        .login-header h1 {
            font-size: 24px;
            margin-bottom: 8px;
            font-weight: 600;
        }
        
        .login-header p {
            opacity: 0.9;
            font-size: 14px;
        }
        
        .login-form {
            padding: 40px 30px;
        }
        
        .form-group {
            margin-bottom: 25px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #333;
            font-weight: 500;
            font-size: 14px;
        }
        
        .form-control {
            width: 100%;
            padding: 12px 16px;
            border: 2px solid #e1e5e9;
            border-radius: 8px;
            font-size: 16px;
            transition: all 0.3s ease;
            background-color: #f8f9fa;
        }
        
        .form-control:focus {
            outline: none;
            border-color: #465ae8;
            background-color: white;
            box-shadow: 0 0 0 3px rgba(70, 90, 232, 0.1);
        }
        
        .btn-login {
            width: 100%;
            padding: 14px;
            background: #465ae8;
            color: white;
            border: none;
            border-radius: 8px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            margin-top: 10px;
        }
        
        .btn-login:hover {
            background: #3a4bc8;
            transform: translateY(-1px);
            box-shadow: 0 4px 12px rgba(70, 90, 232, 0.3);
        }
        
        .btn-login:active {
            transform: translateY(0);
        }
        
        .error-message {
            background: #fee;
            color: #c33;
            padding: 12px 16px;
            border-radius: 6px;
            margin-bottom: 20px;
            border-left: 4px solid #c33;
            font-size: 14px;
        }
        
        .remember-me {
            display: flex;
            align-items: center;
            margin-bottom: 20px;
        }
        
        .remember-me input {
            margin-right: 8px;
        }
        
        .remember-me label {
            margin-bottom: 0;
            font-size: 14px;
            color: #666;
        }
        
        .loading {
            opacity: 0.7;
            pointer-events: none;
        }
        
        .loading .btn-login {
            background: #ccc;
        }
        
        @media (max-width: 480px) {
            .login-container {
                margin: 10px;
            }
            
            .login-form {
                padding: 30px 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="login-container">
        <div class="login-header">
            <h1>YTL Fleet Management</h1>
            <p>Secure Access Portal</p>
        </div>
        
        <div class="login-form">
            <asp:Panel ID="pnlError" runat="server" Visible="false" CssClass="error-message">
                <asp:Label ID="lblError" runat="server" />
            </asp:Panel>
            
            <div class="form-group">
                <label for="txtUsername">Username</label>
                <asp:TextBox ID="txtUsername" runat="server" CssClass="form-control" 
                           placeholder="Enter your username" MaxLength="50" />
                <asp:RequiredFieldValidator ID="rfvUsername" runat="server" 
                                          ControlToValidate="txtUsername"
                                          ErrorMessage="Username is required"
                                          Display="Dynamic"
                                          CssClass="error-message" />
            </div>
            
            <div class="form-group">
                <label for="txtPassword">Password</label>
                <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" 
                           CssClass="form-control" placeholder="Enter your password" />
                <asp:RequiredFieldValidator ID="rfvPassword" runat="server" 
                                          ControlToValidate="txtPassword"
                                          ErrorMessage="Password is required"
                                          Display="Dynamic"
                                          CssClass="error-message" />
            </div>
            
            <div class="remember-me">
                <asp:CheckBox ID="chkRememberMe" runat="server" />
                <label for="chkRememberMe">Remember me for 30 days</label>
            </div>
            
            <asp:Button ID="btnLogin" runat="server" Text="Sign In" 
                      CssClass="btn-login" OnClick="btnLogin_Click" />
        </div>
        
        <!-- CSRF Token -->
        <asp:HiddenField ID="hdnCSRFToken" runat="server" />
    </form>
    
    <script type="text/javascript">
        // Add loading state on form submit
        document.getElementById('form1').addEventListener('submit', function() {
            document.body.classList.add('loading');
        });
        
        // Focus on username field
        window.addEventListener('load', function() {
            document.getElementById('<%= txtUsername.ClientID %>').focus();
        });
        
        // Enter key support
        document.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                document.getElementById('<%= btnLogin.ClientID %>').click();
            }
        });
    </script>
</body>
</html>