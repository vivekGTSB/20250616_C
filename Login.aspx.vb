Imports System.Data.SqlClient

Partial Public Class Login
    Inherits System.Web.UI.Page
    
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Try
            ' Clear any existing authentication
            If AuthenticationHelper.IsUserAuthenticated() Then
                Response.Redirect("~/Dashboard.aspx")
                Return
            End If
            
            If Not Page.IsPostBack Then
                ' Generate CSRF token
                hdnCSRFToken.Value = SecurityHelper.GenerateCSRFToken()
                
                ' Clear any error messages
                pnlError.Visible = False
                
                ' Set focus to username field
                txtUsername.Focus()
            End If
            
        Catch ex As Exception
            SecurityHelper.LogSecurityEvent("LOGIN_PAGE_ERROR", "Error loading login page: " & ex.Message)
            ShowError("An error occurred. Please try again.")
        End Try
    End Sub
    
    Protected Sub btnLogin_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnLogin.Click
        Try
            ' Validate CSRF token
            If Not SecurityHelper.ValidateCSRFToken(hdnCSRFToken.Value) Then
                SecurityHelper.LogSecurityEvent("CSRF_ATTACK", "Invalid CSRF token in login attempt")
                ShowError("Security validation failed. Please refresh the page and try again.")
                Return
            End If
            
            ' Validate page
            If Not Page.IsValid Then
                Return
            End If
            
            ' Get and validate input
            Dim username As String = txtUsername.Text.Trim()
            Dim password As String = txtPassword.Text
            
            ' Additional input validation
            If String.IsNullOrEmpty(username) OrElse String.IsNullOrEmpty(password) Then
                ShowError("Please enter both username and password.")
                Return
            End If
            
            If Not SecurityHelper.ValidateInput(username, "username") Then
                ShowError("Invalid username format.")
                SecurityHelper.LogSecurityEvent("INVALID_USERNAME_FORMAT", "Invalid username format attempted", username)
                Return
            End If
            
            ' Attempt authentication
            If AuthenticationHelper.AuthenticateUser(username, password) Then
                ' Successful login
                If chkRememberMe.Checked Then
                    ' Extend cookie expiration for remember me
                    Dim authCookie As HttpCookie = Response.Cookies(FormsAuthentication.FormsCookieName)
                    If authCookie IsNot Nothing Then
                        authCookie.Expires = DateTime.Now.AddDays(30)
                    End If
                End If
                
                ' Redirect to dashboard
                Response.Redirect("~/Dashboard.aspx", False)
            Else
                ' Failed login
                ShowError("Invalid username or password. Please try again.")
                
                ' Clear password field for security
                txtPassword.Text = String.Empty
                txtUsername.Focus()
            End If
            
        Catch ex As Exception
            SecurityHelper.LogSecurityEvent("LOGIN_ERROR", "Error during login process: " & ex.Message, txtUsername.Text)
            ShowError("An error occurred during login. Please try again.")
        End Try
    End Sub
    
    Private Sub ShowError(message As String)
        lblError.Text = SecurityHelper.SanitizeForHtml(message)
        pnlError.Visible = True
    End Sub
    
End Class