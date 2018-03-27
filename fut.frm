VERSION 5.00
Begin VB.Form Form1 
   BorderStyle     =   1  'Fixed Single
   Caption         =   "Futeboption"
   ClientHeight    =   3195
   ClientLeft      =   4875
   ClientTop       =   2955
   ClientWidth     =   4680
   Icon            =   "fut.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   Picture         =   "fut.frx":1792
   ScaleHeight     =   3195
   ScaleWidth      =   4680
   Begin VB.OptionButton Option1 
      BackColor       =   &H00008000&
      Caption         =   "Option1"
      Height          =   255
      Left            =   360
      TabIndex        =   0
      Top             =   2040
      Width           =   255
   End
   Begin VB.Timer Timer1 
      Interval        =   300
      Left            =   4200
      Top             =   120
   End
   Begin VB.CommandButton cmdMenus 
      Caption         =   "-"
      Height          =   255
      Left            =   3120
      TabIndex        =   10
      Top             =   2880
      Width           =   375
   End
   Begin VB.CommandButton cmdMais 
      Caption         =   "+"
      Height          =   255
      Left            =   3600
      TabIndex        =   9
      Top             =   2880
      Width           =   375
   End
   Begin VB.CommandButton cmdReset 
      Caption         =   "R"
      Height          =   255
      Left            =   840
      TabIndex        =   5
      Top             =   2400
      Width           =   375
   End
   Begin VB.CommandButton cmdBaixo 
      Caption         =   "\/"
      Height          =   255
      Left            =   840
      TabIndex        =   4
      Top             =   2760
      Width           =   375
   End
   Begin VB.CommandButton cmdDireita 
      Caption         =   ">"
      Height          =   255
      Left            =   1320
      TabIndex        =   3
      Top             =   2400
      Width           =   375
   End
   Begin VB.CommandButton cmdCima 
      Caption         =   "/\ "
      Height          =   255
      Left            =   840
      TabIndex        =   2
      Top             =   2040
      Width           =   375
   End
   Begin VB.CommandButton cmdEsqerda 
      Caption         =   "<"
      Height          =   255
      Left            =   360
      TabIndex        =   1
      Top             =   2400
      Width           =   375
   End
   Begin VB.Frame frmPlacar 
      BackColor       =   &H00008000&
      Caption         =   "Placar"
      ForeColor       =   &H8000000E&
      Height          =   855
      Left            =   2160
      TabIndex        =   6
      Top             =   1920
      Width           =   1575
      Begin VB.Label lblAgarrados 
         AutoSize        =   -1  'True
         BackColor       =   &H00008000&
         Caption         =   "Agarrado(s)"
         ForeColor       =   &H8000000E&
         Height          =   195
         Left            =   600
         TabIndex        =   14
         Top             =   480
         Width           =   810
      End
      Begin VB.Label lblNumAgarrado 
         AutoSize        =   -1  'True
         BackColor       =   &H00008000&
         Caption         =   "0"
         ForeColor       =   &H8000000E&
         Height          =   195
         Left            =   240
         TabIndex        =   13
         Top             =   480
         Width           =   90
      End
      Begin VB.Label lblGol 
         AutoSize        =   -1  'True
         BackColor       =   &H00008000&
         Caption         =   "Gol(s)"
         ForeColor       =   &H8000000E&
         Height          =   195
         Left            =   600
         TabIndex        =   8
         Top             =   240
         Width           =   405
      End
      Begin VB.Label lblNum 
         AutoSize        =   -1  'True
         BackColor       =   &H00008000&
         Caption         =   "0"
         ForeColor       =   &H8000000E&
         Height          =   195
         Left            =   240
         TabIndex        =   7
         Top             =   240
         Width           =   90
      End
   End
   Begin VB.Label lblNumNivel 
      BackColor       =   &H00008000&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   3840
      TabIndex        =   16
      Top             =   2280
      Width           =   735
   End
   Begin VB.Label lblNivel 
      AutoSize        =   -1  'True
      BackColor       =   &H00008000&
      Caption         =   "Nível:"
      ForeColor       =   &H8000000E&
      Height          =   195
      Left            =   3840
      TabIndex        =   15
      Top             =   2040
      Width           =   435
   End
   Begin VB.Image imgGol 
      Height          =   1470
      Left            =   240
      Picture         =   "fut.frx":35080
      Top             =   360
      Visible         =   0   'False
      Width           =   3450
   End
   Begin VB.Image imgGoleiro 
      Height          =   405
      Left            =   3000
      Picture         =   "fut.frx":459AA
      Top             =   960
      Width           =   120
   End
   Begin VB.Label lblNumVel 
      BackColor       =   &H00008000&
      BorderStyle     =   1  'Fixed Single
      ForeColor       =   &H8000000E&
      Height          =   255
      Left            =   2400
      TabIndex        =   12
      Top             =   2880
      Width           =   615
   End
   Begin VB.Label lblVelocidade 
      AutoSize        =   -1  'True
      BackColor       =   &H00008000&
      Caption         =   "Velocidade:"
      ForeColor       =   &H8000000E&
      Height          =   195
      Left            =   1440
      TabIndex        =   11
      Top             =   2880
      Width           =   840
   End
   Begin VB.Line Line2 
      X1              =   3000
      X2              =   3480
      Y1              =   1680
      Y2              =   1680
   End
   Begin VB.Line Line1 
      X1              =   3000
      X2              =   3480
      Y1              =   480
      Y2              =   480
   End
End
Attribute VB_Name = "Form1"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'Declarations

Dim Velocidade As Integer
Dim PosAnterior As Integer
Dim PosAtual As Integer
Dim Nivel As Integer

Private Sub cmdBaixo_Click()
    imgGol.Visible = False
    Option1.Top = Option1.Top + Velocidade
    If Option1.Left >= 3000 And Option1.Left < 3841 And Option1.Top >= 270 And Option1.Top < 1560 Then
        Option1.Top = 270
    End If 'Limite parte de cima da trave
    If Option1.Top > 3000 Then 'Limite linha de baixo do programa
        Option1.Top = 3000
    End If
End Sub

Private Sub cmdCima_Click()
    imgGol.Visible = False
    Option1.Top = Option1.Top - Velocidade
    If Option1.Left >= 3000 And Option1.Left < 3841 And Option1.Top > 270 And Option1.Top <= 1560 Then
        Option1.Top = 1560
    End If 'Limite parte de baixo da trave
     If Option1.Top < 0 Then 'Limite linha de cima do programa
        Option1.Top = 0
    End If
End Sub

Private Sub cmdDireita_Click()
    Option1.Left = Option1.Left + Velocidade
    imgGol.Visible = False
    If (Option1.Top >= imgGoleiro.Top And Option1.Top < imgGoleiro.Top + 405) And Option1.Left >= 3000 And Option1.Left < 3900 Then
        Option1.Left = 360
        Option1.Top = 2040
        lblNumAgarrado = lblNumAgarrado + 1
    Else
        If Option1.Left < 3840 And Option1.Left > 3000 And Option1.Top > 420 And Option1.Top < 1560 Then
            imgGol.Visible = True
            Beep
            Option1.Left = 360
            Option1.Top = 2040
            lblNum.Caption = lblNum.Caption + 1
            If Timer1.Interval <= 20 Then
                Timer1.Interval = 10
            Else
                Timer1.Interval = Timer1.Interval - 20
                Nivel = Nivel + 1
            End If
        End If 'Gol
    End If
    

    If Option1.Left > 4440 Then 'Passou do limite da direita do programa
        Option1.Left = 4440
    End If
End Sub

Private Sub cmdEsqerda_Click()
    imgGol.Visible = False
    Option1.Left = Option1.Left - Velocidade
    If Option1.Left > 3000 And Option1.Left <= 3900 And Option1.Top > 270 And Option1.Top <= 1560 Then
        Option1.Left = 3900
    End If 'Limite parte de baixo da trave
     If Option1.Left < 0 Then
        Option1.Left = 0
    End If
End Sub

Private Sub cmdMais_Click()
    imgGol.Visible = False
    Velocidade = Velocidade + 100
    lblNumVel = Velocidade
    
End Sub

Private Sub cmdMenus_Click()
    imgGol.Visible = False
    Velocidade = Velocidade - 100
    If Velocidade <= 0 Then
        Velocidade = 0
    End If
    lblNumVel = Velocidade
End Sub

Private Sub cmdReset_Click()
    imgGol.Visible = False
    Option1.Left = 360
    Option1.Top = 2040
    lblNum.Caption = 0
    lblNumAgarrado = 0
    Velocidade = 400
    lblNumVel = Velocidade
    Nivel = 1
    Timer1.Interval = 300
End Sub

Private Sub Form_Load()
    Velocidade = 400
    lblNumVel = Velocidade
    PosAnterior = imgGoleiro.Top
    imgGoleiro.Top = imgGoleiro.Top + 130
    PosAtual = imgGoleiro.Top
    Nivel = 1
    lblNumNivel = Nivel
        
End Sub


Private Sub Timer1_Timer()
    
    lblNumNivel = Nivel
    If PosAtual > PosAnterior Then 'Goleiro indo em direção para baixo
        PosAnterior = PosAtual
        If imgGoleiro.Top >= 1320 Then 'Passou da trave inferior
            imgGoleiro.Top = imgGoleiro.Top - 130
        Else 'imgGoleiro.Top < 1440 - Não passou da trave inferior
            imgGoleiro.Top = imgGoleiro.Top + 130
        End If
    Else 'PosAnterior < PosAtual - Goleiro indo em direção para cima
        PosAnterior = PosAtual
        If imgGoleiro.Top <= 480 Then 'Passou da trave superior
            imgGoleiro.Top = imgGoleiro.Top + 130
        Else 'imgGoleiro.Top < 480 - Não passou da trave superior
            imgGoleiro.Top = imgGoleiro.Top - 130
        End If
    End If
    PosAtual = imgGoleiro.Top
End Sub
