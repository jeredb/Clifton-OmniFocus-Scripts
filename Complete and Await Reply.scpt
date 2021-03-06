FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
	This script marks the selected actions as complete and creates new actions in a "Waiting For" context to track replies.
	
	version 0.1, by Curt Clifton
	
	Copyright � 2007-2008, Curtis Clifton
	
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
	
		� Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		
		� Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	version 0.1: Original release
     � 	 	� 
 	 T h i s   s c r i p t   m a r k s   t h e   s e l e c t e d   a c t i o n s   a s   c o m p l e t e   a n d   c r e a t e s   n e w   a c t i o n s   i n   a   " W a i t i n g   F o r "   c o n t e x t   t o   t r a c k   r e p l i e s . 
 	 
 	 v e r s i o n   0 . 1 ,   b y   C u r t   C l i f t o n 
 	 
 	 C o p y r i g h t   �   2 0 0 7 - 2 0 0 8 ,   C u r t i s   C l i f t o n 
 	 
 	 A l l   r i g h t s   r e s e r v e d . 
 	 
 	 R e d i s t r i b u t i o n   a n d   u s e   i n   s o u r c e   a n d   b i n a r y   f o r m s ,   w i t h   o r   w i t h o u t   m o d i f i c a t i o n ,   a r e   p e r m i t t e d   p r o v i d e d   t h a t   t h e   f o l l o w i n g   c o n d i t i o n s   a r e   m e t : 
 	 
 	 	 "   R e d i s t r i b u t i o n s   o f   s o u r c e   c o d e   m u s t   r e t a i n   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r . 
 	 	 
 	 	 "   R e d i s t r i b u t i o n s   i n   b i n a r y   f o r m   m u s t   r e p r o d u c e   t h e   a b o v e   c o p y r i g h t   n o t i c e ,   t h i s   l i s t   o f   c o n d i t i o n s   a n d   t h e   f o l l o w i n g   d i s c l a i m e r   i n   t h e   d o c u m e n t a t i o n   a n d / o r   o t h e r   m a t e r i a l s   p r o v i d e d   w i t h   t h e   d i s t r i b u t i o n . 
 	 	 
 	 T H I S   S O F T W A R E   I S   P R O V I D E D   B Y   T H E   C O P Y R I G H T   H O L D E R S   A N D   C O N T R I B U T O R S   " A S   I S "   A N D   A N Y   E X P R E S S   O R   I M P L I E D   W A R R A N T I E S ,   I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   T H E   I M P L I E D   W A R R A N T I E S   O F   M E R C H A N T A B I L I T Y   A N D   F I T N E S S   F O R   A   P A R T I C U L A R   P U R P O S E   A R E   D I S C L A I M E D .   I N   N O   E V E N T   S H A L L   T H E   C O P Y R I G H T   O W N E R   O R   C O N T R I B U T O R S   B E   L I A B L E   F O R   A N Y   D I R E C T ,   I N D I R E C T ,   I N C I D E N T A L ,   S P E C I A L ,   E X E M P L A R Y ,   O R   C O N S E Q U E N T I A L   D A M A G E S   ( I N C L U D I N G ,   B U T   N O T   L I M I T E D   T O ,   P R O C U R E M E N T   O F   S U B S T I T U T E   G O O D S   O R   S E R V I C E S ;   L O S S   O F   U S E ,   D A T A ,   O R   P R O F I T S ;   O R   B U S I N E S S   I N T E R R U P T I O N )   H O W E V E R   C A U S E D   A N D   O N   A N Y   T H E O R Y   O F   L I A B I L I T Y ,   W H E T H E R   I N   C O N T R A C T ,   S T R I C T   L I A B I L I T Y ,   O R   T O R T   ( I N C L U D I N G   N E G L I G E N C E   O R   O T H E R W I S E )   A R I S I N G   I N   A N Y   W A Y   O U T   O F   T H E   U S E   O F   T H I S   S O F T W A R E ,   E V E N   I F   A D V I S E D   O F   T H E   P O S S I B I L I T Y   O F   S U C H   D A M A G E . 
 	 
 	 v e r s i o n   0 . 1 :   O r i g i n a l   r e l e a s e 
   
  
 l     ��������  ��  ��        l      ��  ��    � �
	This string is matched against your contexts to find a context in which to place the new "waiting-for" action.  The matching is the same as in the context column in OmniFocus, so you don't need the entire contexxt name, just a unique fragment.
     �  � 
 	 T h i s   s t r i n g   i s   m a t c h e d   a g a i n s t   y o u r   c o n t e x t s   t o   f i n d   a   c o n t e x t   i n   w h i c h   t o   p l a c e   t h e   n e w   " w a i t i n g - f o r "   a c t i o n .     T h e   m a t c h i n g   i s   t h e   s a m e   a s   i n   t h e   c o n t e x t   c o l u m n   i n   O m n i F o c u s ,   s o   y o u   d o n ' t   n e e d   t h e   e n t i r e   c o n t e x x t   n a m e ,   j u s t   a   u n i q u e   f r a g m e n t . 
      j     �� �� &0 waitingforcontext waitingForContext  m        �    w a i t      l     ��������  ��  ��        l      ��  ��    k e
	This string is used as a prefix on the original item title when creating the "waiting-for" action.
     �   � 
 	 T h i s   s t r i n g   i s   u s e d   a s   a   p r e f i x   o n   t h e   o r i g i n a l   i t e m   t i t l e   w h e n   c r e a t i n g   t h e   " w a i t i n g - f o r "   a c t i o n . 
      j    �� �� 0 waitingprefix waitingPrefix  m         � ! !  R e p l y   o n :     " # " l     ��������  ��  ��   #  $ % $ l      �� & '��   & � � 
	This string is used in the Growl notification if multiple items are processed. For single items, we use the actual item title. 
    ' � ( (   
 	 T h i s   s t r i n g   i s   u s e d   i n   t h e   G r o w l   n o t i f i c a t i o n   i f   m u l t i p l e   i t e m s   a r e   p r o c e s s e d .   F o r   s i n g l e   i t e m s ,   w e   u s e   t h e   a c t u a l   i t e m   t i t l e .   
 %  ) * ) j    �� +�� 00 multipleitemscompleted multipleItemsCompleted + m     , , � - -  M u l t i p l e   I t e m s *  . / . l     ��������  ��  ��   /  0 1 0 l      �� 2 3��   2 M G
	The following properties are used for script notification via Growl.
    3 � 4 4 � 
 	 T h e   f o l l o w i n g   p r o p e r t i e s   a r e   u s e d   f o r   s c r i p t   n o t i f i c a t i o n   v i a   G r o w l . 
 1  5 6 5 j   	 �� 7�� 0 growlappname growlAppName 7 m   	 
 8 8 � 9 9  C u r t ' s   S c r i p t s 6  : ; : j    �� <�� 20 scriptstartnotification scriptStartNotification < m     = = � > >  S c r i p t   B e g a n ;  ? @ ? j    �� A�� 40 scriptfinishnotification scriptFinishNotification A m     B B � C C   S c r i p t   C o m p l e t e d @  D E D j    �� F�� ,0 defaultnotifications defaultNotifications F J     G G  H�� H o    ���� 40 scriptfinishnotification scriptFinishNotification��   E  I J I j    �� K�� $0 allnotifications allNotifications K b     L M L o    ���� ,0 defaultnotifications defaultNotifications M J     N N  O�� O o    ���� 20 scriptstartnotification scriptStartNotification��   J  P Q P j     �� R�� 00 iconloaningapplication iconLoaningApplication R m     S S � T T  O m n i F o c u s . a p p Q  U V U l     ��������  ��  ��   V  W X W l     Y���� Y r      Z [ Z m     ��
�� 
msng [ o      ���� 0 	itemtitle 	itemTitle��  ��   X  \ ] \ l   � ^���� ^ O    � _ ` _ O    � a b a k    � c c  d e d l   �� f g��   f   Gets target context    g � h h (   G e t s   t a r g e t   c o n t e x t e  i j i r    ! k l k n     m n m 1    ��
�� 
ID   n n     o p o 4    �� q
�� 
cobj q m    ����  p l    r���� r I   �� s t
�� .OFOCFCCmnull���     ctxt s o    ���� &0 waitingforcontext waitingForContext t �� u��
�� 
kocl u m    ��
�� 
FCct��  ��  ��   l o      ���� 0 thecontextid theContextID j  v w v r   " 1 x y x 6  " / z { z 4  " &�� |
�� 
FCct | m   $ %����  { =  ' . } ~ } 1   ( *��
�� 
ID   ~ o   + -���� 0 thecontextid theContextID y o      ���� ,0 thewaitingforcontext theWaitingForContext w  ��  O   2 � � � � l  ; � � � � � k   ; � � �  � � � r   ; D � � � n   ; @ � � � 1   > @��
�� 
valL � 2   ; >��
�� 
OTst � o      ���� $0 theselecteditems theSelectedItems �  � � � Z   E e � ����� � l  E N ����� � A   E N � � � l  E L ����� � I  E L�� ���
�� .corecnte****       **** � o   E H���� $0 theselecteditems theSelectedItems��  ��  ��   � m   L M���� ��  ��   � k   Q a � �  � � � I  Q ^�� � �
�� .sysodisAaleR        TEXT � m   Q T � � � � � T Y o u   m u s t   f i r s t   s e l e c t   a n   i t e m   t o   c o m p l e t e . � �� ���
�� 
as A � m   W Z��
�� EAlTwarN��   �  ��� � L   _ a����  ��  ��  ��   �  � � � X   f � ��� � � k   x � � �  � � � r   x  � � � n   x } � � � 1   y }��
�� 
pnam � o   x y���� 0 anitem anItem � o      ���� 0 	itemtitle 	itemTitle �  � � � r   � � � � � I  � ��� � �
�� .coreclon****      � **** � o   � ����� 0 anitem anItem � �� ���
�� 
insh � n   � � � � � 9   � ���
�� 
insl � o   � ����� 0 anitem anItem��   � o      ���� 0 thedupe theDupe �  � � � r   � � � � � m   � ���
�� boovtrue � n       � � � 1   � ���
�� 
FCcd � o   � ����� 0 anitem anItem �  � � � l  � ���������  ��  ��   �  � � � l  � ��� � ���   � #  Configure the duplicate item    � � � � :   C o n f i g u r e   t h e   d u p l i c a t e   i t e m �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
pnam � o   � ����� 0 thedupe theDupe � o      ���� 0 oldname oldName �  � � � r   � � � � � b   � � � � � o   � ����� 0 waitingprefix waitingPrefix � o   � ����� 0 oldname oldName � n       � � � 1   � ���
�� 
pnam � o   � ����� 0 thedupe theDupe �  � � � r   � � � � � o   � ����� ,0 thewaitingforcontext theWaitingForContext � n       � � � m   � ���
�� 
FCct � o   � ����� 0 thedupe theDupe �  ��� � r   � � � � � m   � ���
�� 
msng � n       � � � 1   � ���
�� 
FCRp � o   � ����� 0 thedupe theDupe��  �� 0 anitem anItem � o   i l���� $0 theselecteditems theSelectedItems �  ��� � Z   � � � ����� � ?   � � � � � l  � � ����� � I  � ��� ���
�� .corecnte****       **** � o   � ����� $0 theselecteditems theSelectedItems��  ��  ��   � m   � �����  � r   � � � � � o   � ����� 00 multipleitemscompleted multipleItemsCompleted � o      ���� 0 	itemtitle 	itemTitle��  ��  ��   � / ) (first document window whose index is 1)    � � � � R   ( f i r s t   d o c u m e n t   w i n d o w   w h o s e   i n d e x   i s   1 ) � n   2 8 � � � 1   6 8��
�� 
FCcn � 4   2 6�� �
�� 
FCdw � m   4 5���� ��   b 4   �� �
�� 
docu � m   
 ����  ` m     � ��                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  ����l        ����  	                Applications    �W��      �9�       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  ��  ��   ]  � � � l  � ���� � Z   � � ��~�} � >  � � � � � o   � ��|�| 0 	itemtitle 	itemTitle � m   � ��{
�{ 
msng � n  � � � � � I   � ��z ��y�z 
0 notify   �  � � � m   � � � � � � � 8 C o m p l e t e d   a n d   A w a i t i n g   R e p l y �  � � � o   � ��x�x 0 	itemtitle 	itemTitle �  ��w � o   � ��v�v 40 scriptfinishnotification scriptFinishNotification�w  �y   �  f   � ��~  �}  ��  �   �  � � � l     �u�t�s�u  �t  �s   �  � � � l      �r � ��r   �
	Uses Growl to display a notification message.
	theTitle � a string giving the notification title
	theDescription � a string describing the notification event
	theNotificationKind � a string giving the notification kind (must be an element of allNotifications)
    � � � � 
 	 U s e s   G r o w l   t o   d i s p l a y   a   n o t i f i c a t i o n   m e s s a g e . 
 	 t h e T i t l e      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   t i t l e 
 	 t h e D e s c r i p t i o n      a   s t r i n g   d e s c r i b i n g   t h e   n o t i f i c a t i o n   e v e n t 
 	 t h e N o t i f i c a t i o n K i n d      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   k i n d   ( m u s t   b e   a n   e l e m e n t   o f   a l l N o t i f i c a t i o n s ) 
 �  ��q � i   ! $   I      �p�o�p 
0 notify    o      �n�n 0 thetitle theTitle  o      �m�m  0 thedescription theDescription �l o      �k�k *0 thenotificationkind theNotificationKind�l  �o   O     4	 k    3

  I   !�j�i
�j .registernull��� ��� null�i   �h
�h 
appl o    �g�g 0 growlappname growlAppName �f
�f 
anot o    �e�e $0 allnotifications allNotifications �d
�d 
dnot o    �c�c ,0 defaultnotifications defaultNotifications �b�a
�b 
iapp o    �`�` 00 iconloaningapplication iconLoaningApplication�a   �_ I  " 3�^�]
�^ .notifygrnull��� ��� null�]   �\
�\ 
name o   $ %�[�[ *0 thenotificationkind theNotificationKind �Z
�Z 
titl o   & '�Y�Y 0 thetitle theTitle �X
�X 
appl o   ( -�W�W 0 growlappname growlAppName �V�U
�V 
desc o   . /�T�T  0 thedescription theDescription�U  �_  	 m     2                                                                                  GRRR   alis    �  Mac Book Pro               �WXfH+   8 �GrowlHelperApp.app                                              8 ��n̥        ����  	                	Resources     �W��      �o�     8 � 8 � 8 �  �     YMac Book Pro:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c   B o o k   P r o  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  �q       �S    , 8 = B ! S"#�S   �R�Q�P�O�N�M�L�K�J�I�H�R &0 waitingforcontext waitingForContext�Q 0 waitingprefix waitingPrefix�P 00 multipleitemscompleted multipleItemsCompleted�O 0 growlappname growlAppName�N 20 scriptstartnotification scriptStartNotification�M 40 scriptfinishnotification scriptFinishNotification�L ,0 defaultnotifications defaultNotifications�K $0 allnotifications allNotifications�J 00 iconloaningapplication iconLoaningApplication�I 
0 notify  
�H .aevtoappnull  �   � ****  �G$�G $   B! �F%�F %   B =" �E�D�C&'�B�E 
0 notify  �D �A(�A (  �@�?�>�@ 0 thetitle theTitle�?  0 thedescription theDescription�> *0 thenotificationkind theNotificationKind�C  & �=�<�;�= 0 thetitle theTitle�<  0 thedescription theDescription�; *0 thenotificationkind theNotificationKind' �:�9�8�7�6�5�4�3�2�1
�: 
appl
�9 
anot
�8 
dnot
�7 
iapp�6 
�5 .registernull��� ��� null
�4 
name
�3 
titl
�2 
desc
�1 .notifygrnull��� ��� null�B 5� 1*�b  �b  �b  �b  � O*���b  �� 
U# �0)�/�.*+�-
�0 .aevtoappnull  �   � ****) k    ,,  W--  \..  ��,�,  �/  �.  * �+�+ 0 anitem anItem+  �*�) ��(�'�&�%�$�#�"/�!� ����� ������������ ��
�* 
msng�) 0 	itemtitle 	itemTitle
�( 
docu
�' 
kocl
�& 
FCct
�% .OFOCFCCmnull���     ctxt
�$ 
cobj
�# 
ID  �" 0 thecontextid theContextID/  �! ,0 thewaitingforcontext theWaitingForContext
�  
FCdw
� 
FCcn
� 
OTst
� 
valL� $0 theselecteditems theSelectedItems
� .corecnte****       ****
� 
as A
� EAlTwarN
� .sysodisAaleR        TEXT
� 
pnam
� 
insh
� 
insl
� .coreclon****      � ****� 0 thedupe theDupe
� 
FCcd� 0 oldname oldName
� 
FCRp� 
0 notify  �-�E�O� �*�k/ �b   ��l �k/�,E�O*�k/�[�,\Z�81E�O*�k/�, �*�-�,E` O_ j k a a a l OhY hO g_ [��l kh  �a ,E�O�a �a 4l E` Oe�a ,FO_ a ,E` Ob  _ %_ a ,FO�_ �,FO�_ a ,F[OY��O_ j k b  E�Y hUUUO�� )a �b  m+ Y h ascr  ��ޭ