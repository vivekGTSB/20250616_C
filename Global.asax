<%@ Application Language="VB" %>

<script runat="server">
    
    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application startup
        SecurityHelper.LogSecurityEvent("APPLICATION_START", "Application started")
    End Sub
    
    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs on application shutdown
        SecurityHelper.LogSecurityEvent("APPLICATION_END", "Application ended")
    End Sub
    
    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
        Dim ex As Exception = Server.GetLastError()
        If ex IsNot Nothing Then
            SecurityHelper.LogSecurityEvent("APPLICATION_ERROR", "Unhandled error: " & ex.Message)
        End If
    End Sub
    
    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
        SecurityHelper.LogSecurityEvent("SESSION_START", "New session started")
    End Sub
    
    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a session ends
        SecurityHelper.LogSecurityEvent("SESSION_END", "Session ended")
    End Sub
    
    Sub Application_BeginRequest(ByVal sender As Object, ByVal e As EventArgs)
        ' Security headers and request validation
        Try
            ' Force HTTPS in production
            If Not Request.IsSecureConnection AndAlso Not Request.IsLocal Then
                Dim secureUrl As String = Request.Url.ToString().Replace("http://", "https://")
                Response.Redirect(secureUrl, True)
            End If
            
            ' Add security headers if not already present
            If Not Response.Headers("X-Frame-Options") Then
                Response.Headers.Add("X-Frame-Options", "DENY")
            End If
            
            If Not Response.Headers("X-Content-Type-Options") Then
                Response.Headers.Add("X-Content-Type-Options", "nosniff")
            End If
            
            If Not Response.Headers("X-XSS-Protection") Then
                Response.Headers.Add("X-XSS-Protection", "1; mode=block")
            End If
            
        Catch ex As Exception
            ' Log but don't break the request
            SecurityHelper.LogSecurityEvent("BEGIN_REQUEST_ERROR", "Error in BeginRequest: " & ex.Message)
        End Try
    End Sub
    
</script>