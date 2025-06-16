Imports System.Data.SqlClient
Imports System.Data

Public Class DatabaseHelper
    
    Private Shared ReadOnly ConnectionString As String = 
        System.Configuration.ConfigurationManager.AppSettings("sqlserverconnection")
    
    Public Shared Function ExecuteQuery(query As String, parameters As SqlParameter()) As DataTable
        Dim dt As New DataTable()
        
        Try
            Using conn As New SqlConnection(ConnectionString)
                Using cmd As SqlCommand = SecurityHelper.CreateSafeCommand(query, conn)
                    If parameters IsNot Nothing Then
                        cmd.Parameters.AddRange(parameters)
                    End If
                    
                    conn.Open()
                    Using adapter As New SqlDataAdapter(cmd)
                        adapter.Fill(dt)
                    End Using
                End Using
            End Using
        Catch ex As Exception
            SecurityHelper.LogSecurityEvent("DATABASE_ERROR", "Database query error: " & ex.Message)
            Throw New ApplicationException("Database operation failed", ex)
        End Try
        
        Return dt
    End Function
    
    Public Shared Function ExecuteNonQuery(query As String, parameters As SqlParameter()) As Integer
        Dim result As Integer = 0
        
        Try
            Using conn As New SqlConnection(ConnectionString)
                Using cmd As SqlCommand = SecurityHelper.CreateSafeCommand(query, conn)
                    If parameters IsNot Nothing Then
                        cmd.Parameters.AddRange(parameters)
                    End If
                    
                    conn.Open()
                    result = cmd.ExecuteNonQuery()
                End Using
            End Using
        Catch ex As Exception
            SecurityHelper.LogSecurityEvent("DATABASE_ERROR", "Database command error: " & ex.Message)
            Throw New ApplicationException("Database operation failed", ex)
        End Try
        
        Return result
    End Function
    
    Public Shared Function ExecuteScalar(query As String, parameters As SqlParameter()) As Object
        Dim result As Object = Nothing
        
        Try
            Using conn As New SqlConnection(ConnectionString)
                Using cmd As SqlCommand = SecurityHelper.CreateSafeCommand(query, conn)
                    If parameters IsNot Nothing Then
                        cmd.Parameters.AddRange(parameters)
                    End If
                    
                    conn.Open()
                    result = cmd.ExecuteScalar()
                End Using
            End Using
        Catch ex As Exception
            SecurityHelper.LogSecurityEvent("DATABASE_ERROR", "Database scalar error: " & ex.Message)
            Throw New ApplicationException("Database operation failed", ex)
        End Try
        
        Return result
    End Function
    
    Public Shared Function CreateParameter(name As String, value As Object) As SqlParameter
        Return New SqlParameter(name, If(value, DBNull.Value))
    End Function
    
End Class