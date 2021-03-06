FasdUAS 1.101.10   ��   ��    k             l      ��  ��   	�	�
	Populate Template Placeholders

	This script populates a copy of a template by replacing placeholders with text.
	
	by Curt Clifton
	
	Copyright � 2007�2009, Curtis Clifton
	
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
	
		� Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		
		� Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	Version History:

		0.7.1, gracefully handles more unexpected user actions	
		0.7, populates projects with dates but no other placeholders, cleans up after itself on Cancel
		0.6.2, detects if user is attempting to Populate something other than a Project
		0.6.1, optimized placeholder replacement: fixes bug with apostrophes in replacements and is also faster 
		0.6, looks for paragraph beginning "Due Date is" in the note of the template project and uses that as a prompt in the due date dialog box.  Fixed bug where due times were munged if project start or due date wasn't set to 12am.
		0.5.1 updated for OmniFocus AppleScript dictionary change
		0.5, added Growl notifications, better error checking, bug fix in date handling, work around for OF multiple-window bug, and replacement of placeholders in notes
		0.4, automatically duplicates the project, works with content pane or sidebar selection
		0.3, now works for subprojects
		0.2, clears placeholders from note of project
		0.1, initial release, 6/13/07

     � 	 	F 
 	 P o p u l a t e   T e m p l a t e   P l a c e h o l d e r s 
 
 	 T h i s   s c r i p t   p o p u l a t e s   a   c o p y   o f   a   t e m p l a t e   b y   r e p l a c i n g   p l a c e h o l d e r s   w i t h   t e x t . 
 	 
 	 b y   C u r t   C l i f t o n 
 	 
 	 C o p y r i g h t   �   2 0 0 7  2 0 0 9 ,   C u r t i s   C l i f t o n 
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
 	 V e r s i o n   H i s t o r y : 
 
 	 	 0 . 7 . 1 ,   g r a c e f u l l y   h a n d l e s   m o r e   u n e x p e c t e d   u s e r   a c t i o n s 	 
 	 	 0 . 7 ,   p o p u l a t e s   p r o j e c t s   w i t h   d a t e s   b u t   n o   o t h e r   p l a c e h o l d e r s ,   c l e a n s   u p   a f t e r   i t s e l f   o n   C a n c e l 
 	 	 0 . 6 . 2 ,   d e t e c t s   i f   u s e r   i s   a t t e m p t i n g   t o   P o p u l a t e   s o m e t h i n g   o t h e r   t h a n   a   P r o j e c t 
 	 	 0 . 6 . 1 ,   o p t i m i z e d   p l a c e h o l d e r   r e p l a c e m e n t :   f i x e s   b u g   w i t h   a p o s t r o p h e s   i n   r e p l a c e m e n t s   a n d   i s   a l s o   f a s t e r   
 	 	 0 . 6 ,   l o o k s   f o r   p a r a g r a p h   b e g i n n i n g   " D u e   D a t e   i s "   i n   t h e   n o t e   o f   t h e   t e m p l a t e   p r o j e c t   a n d   u s e s   t h a t   a s   a   p r o m p t   i n   t h e   d u e   d a t e   d i a l o g   b o x .     F i x e d   b u g   w h e r e   d u e   t i m e s   w e r e   m u n g e d   i f   p r o j e c t   s t a r t   o r   d u e   d a t e   w a s n ' t   s e t   t o   1 2 a m . 
 	 	 0 . 5 . 1   u p d a t e d   f o r   O m n i F o c u s   A p p l e S c r i p t   d i c t i o n a r y   c h a n g e 
 	 	 0 . 5 ,   a d d e d   G r o w l   n o t i f i c a t i o n s ,   b e t t e r   e r r o r   c h e c k i n g ,   b u g   f i x   i n   d a t e   h a n d l i n g ,   w o r k   a r o u n d   f o r   O F   m u l t i p l e - w i n d o w   b u g ,   a n d   r e p l a c e m e n t   o f   p l a c e h o l d e r s   i n   n o t e s 
 	 	 0 . 4 ,   a u t o m a t i c a l l y   d u p l i c a t e s   t h e   p r o j e c t ,   w o r k s   w i t h   c o n t e n t   p a n e   o r   s i d e b a r   s e l e c t i o n 
 	 	 0 . 3 ,   n o w   w o r k s   f o r   s u b p r o j e c t s 
 	 	 0 . 2 ,   c l e a r s   p l a c e h o l d e r s   f r o m   n o t e   o f   p r o j e c t 
 	 	 0 . 1 ,   i n i t i a l   r e l e a s e ,   6 / 1 3 / 0 7 
 
   
  
 l     ��������  ��  ��        j     �� �� &0 placeholderopener placeholderOpener  m        �    �      j    �� �� &0 placeholdercloser placeholderCloser  m       �    �      l     ��������  ��  ��        l      ��  ��    M G
	The following properties are used for script notification via Growl.
     �   � 
 	 T h e   f o l l o w i n g   p r o p e r t i e s   a r e   u s e d   f o r   s c r i p t   n o t i f i c a t i o n   v i a   G r o w l . 
      j    �� �� 0 growlappname growlAppName  m         � ! !  C u r t ' s   S c r i p t s   " # " j   	 �� $�� 20 scriptstartnotification scriptStartNotification $ m   	 
 % % � & &  S c r i p t   B e g a n #  ' ( ' j    �� )�� 40 scriptfinishnotification scriptFinishNotification ) m     * * � + +   S c r i p t   C o m p l e t e d (  , - , j    �� .�� ,0 defaultnotifications defaultNotifications . J     / /  0�� 0 o    ���� 40 scriptfinishnotification scriptFinishNotification��   -  1 2 1 j    �� 3�� $0 allnotifications allNotifications 3 b     4 5 4 o    ���� ,0 defaultnotifications defaultNotifications 5 J     6 6  7�� 7 o    ���� 20 scriptstartnotification scriptStartNotification��   2  8 9 8 j    �� :�� 00 iconloaningapplication iconLoaningApplication : m     ; ; � < <  O m n i F o c u s . a p p 9  = > = l     ��������  ��  ��   >  ? @ ? l      �� A B��   A s m
	The following properties are used for debugging.  You probably don�t want to mess with them.  Just sayin�.
    B � C C � 
 	 T h e   f o l l o w i n g   p r o p e r t i e s   a r e   u s e d   f o r   d e b u g g i n g .     Y o u   p r o b a b l y   d o n  t   w a n t   t o   m e s s   w i t h   t h e m .     J u s t   s a y i n  . 
 @  D E D j     �� F�� .0 abortafterinputchecks abortAfterInputChecks F m    ��
�� boovfals E  G H G j   ! #�� I�� 0 indebugmode inDebugMode I m   ! "��
�� boovfals H  J K J l     ��������  ��  ��   K  L M L l   $ N���� N O    $ O P O k   # Q Q  R S R O    T U T k    V V  W X W O    K Y Z Y l   J [ \ ] [ k    J ^ ^  _ ` _ Z    * a b���� a l    c���� c >    d e d n     f g f 1    ��
�� 
FCvm g  g     e m     h h � i i  p r o j e c t��  ��   b k    & j j  k l k I   #�� m n
�� .sysodisAaleR        TEXT m m     o o � p p T Y o u   m u s t   s e l e c t   a   p r o j e c t   i n   p l a n n i n g   m o d e n �� q r
�� 
mesS q m     s s � t t � S w i t c h   t o   p l a n n i n g   m o d e   ( V i e w  !�   P l a n n i n g   M o d e )   a n d   s e l e c t   a   p r o j e c t   t o   p o p u l a t e . r �� u��
�� 
as A u m    ��
�� EAlTwarN��   l  v�� v L   $ &����  ��  ��  ��   `  w x w r   + 2 y z y n   + 0 { | { 2  . 0��
�� 
OTst | 1   + .��
�� 
FCcn z o      ���� $0 theselecteditems theSelectedItems x  }�� } Z   3 J ~ ���� ~ l  3 : ����� � >   3 : � � � l  3 8 ����� � I  3 8�� ���
�� .corecnte****       **** � o   3 4���� $0 theselecteditems theSelectedItems��  ��  ��   � m   8 9���� ��  ��    k   = F � �  � � � l  = =�� � ���   �   try sidebar selection    � � � � ,   t r y   s i d e b a r   s e l e c t i o n �  ��� � r   = F � � � n   = D � � � 2  B D��
�� 
OTst � 1   = B��
�� 
FCSt � o      ���� $0 theselecteditems theSelectedItems��  ��  ��  ��   \ / ) (first document window whose index is 1)    ] � � � R   ( f i r s t   d o c u m e n t   w i n d o w   w h o s e   i n d e x   i s   1 ) Z 4    �� �
�� 
FCdw � m    ����  X  � � � Z   L j � ����� � l  L S ����� � A   L S � � � l  L Q ����� � I  L Q�� ���
�� .corecnte****       **** � o   L M���� $0 theselecteditems theSelectedItems��  ��  ��   � m   Q R���� ��  ��   � k   V f � �  � � � I  V c�� � �
�� .sysodisAaleR        TEXT � m   V Y � � � � � \ Y o u   m u s t   f i r s t   s e l e c t   t h e   p r o j e c t   t o   p o p u l a t e . � �� � �
�� 
mesS � m   Z ] � � � � � x S e l e c t   a   s i n g l e   p r o j e c t   t h a t   i n c l u d e s   t e m p l a t e   p l a c e h o l d e r s . � �� ���
�� 
as A � m   ^ _��
�� EAlTwarN��   �  ��� � L   d f����  ��  ��  ��   �  � � � Z   k � � ����� � l  k r ����� � ?   k r � � � l  k p ����� � I  k p�� ���
�� .corecnte****       **** � o   k l���� $0 theselecteditems theSelectedItems��  ��  ��   � m   p q���� ��  ��   � k   u � � �  � � � I  u ��� � �
�� .sysodisAaleR        TEXT � m   u x � � � � � B Y o u   m u s t   s e l e c t   j u s t   o n e   p r o j e c t . � �� � �
�� 
mesS � m   y | � � � � � � S e l e c t   a   s i n g l e   p r o j e c t   t h a t   i n c l u d e s   t e m p l a t e   p l a c e h o l d e r s ,   b u t   d o n  t   s e l e c t   t h e   a c t i o n s   a n d   s u b p r o j e c t s   u n d e r   i t . � �� ���
�� 
as A � m   } ~��
�� EAlTwarN��   �  ��� � L   � �����  ��  ��  ��   �  � � � l  � ���������  ��  ��   �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
valL � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� $0 theselecteditems theSelectedItems � o      ���� 0 selecteditem selectedItem �  � � � r   � � � � � n   � � � � � 1   � ���
�� 
pnam � n   � � � � � 4   � ��� �
�� 
cobj � m   � �����  � o   � ����� $0 theselecteditems theSelectedItems � o      ����  0 theprojectname theProjectName �  � � � Z   � � � ����� � l  � � ����� � >  � � � � � n   � � � � � 1   � ���
�� 
pcls � o   � ����� 0 selecteditem selectedItem � m   � ���
�� 
FCpr��  ��   � k   � � � �  � � � I  � ��� � �
�� .sysodisAaleR        TEXT � b   � � � � � b   � � � � � m   � � � � � � � ( T h e   s e l e c t e d   i t e m ,    � o   � �����  0 theprojectname theProjectName � m   � � � � � � � &    i s   n o t   a   p r o j e c t . � �� � �
�� 
mesS � m   � � � � � � � � T h e   s c r i p t   o n l y   w o r k s   w i t h   p r o j e c t s ,   n o t   a c t i o n s   o r   f o l d e r s .     P l e a s e   s e l e c t   a   p r o j e c t   t o   u s e   t h e   s c r i p t . � �� � �
�� 
as A � m   � ���
�� EAlTwarN � �� � �
�� 
btns � J   � � � �  �� � m   � � � � � � �  O K�   � �~ ��}
�~ 
dflt � m   � ��|�| �}   �  ��{ � L   � ��z�z  �{  ��  ��   �  � � � r   � � � � � n   � � � � � 1   � ��y
�y 
FCno � o   � ��x�x 0 selecteditem selectedItem � o      �w�w 0 thenote theNote �  � � � r   � � � � � J   � ��v�v   � o      �u�u "0 theplaceholders thePlaceholders �    Q   ��t k   �  r   � n   � �	
	 4  � ��s
�s 
cpar m   � ��r�r��
 o   � ��q�q 0 thenote theNote o      �p�p ,0 theplaceholderstring thePlaceholderString �o r   n  I  �n�m�n 00 parseplaceholderstring parsePlaceholderString �l o  �k�k ,0 theplaceholderstring thePlaceholderString�l  �m    f   o      �j�j "0 theplaceholders thePlaceholders�o   R      �i�h�g
�i .ascrerr ****      � ****�h  �g  �t    r  % n  ! 1  !�f
�f 
FCDs o  �e�e 0 selecteditem selectedItem o      �d�d 0 thestartdate theStartDate  r  &1 n  &- 1  )-�c
�c 
FCDd o  &)�b�b 0 selecteditem selectedItem o      �a�a 0 
theduedate 
theDueDate   Z  2�!"�`�_! l 2W#�^�]# F  2W$%$ F  2G&'& = 29()( o  25�\�\ 0 thestartdate theStartDate) m  58�[
�[ 
msng' = <C*+* o  <?�Z�Z 0 
theduedate 
theDueDate+ m  ?B�Y
�Y 
msng% = JS,-, l JQ.�X�W. I JQ�V/�U
�V .corecnte****       ****/ o  JM�T�T "0 theplaceholders thePlaceholders�U  �X  �W  - m  QR�S�S  �^  �]  " k  Z�00 121 I Z��R34
�R .sysodisAaleR        TEXT3 b  Ze565 b  Za787 m  Z]99 �::  T h i s   p r o j e c t ,   8 o  ]`�Q�Q  0 theprojectname theProjectName6 m  ad;; �<< `  ,   d o e s   n o t   c o n t a i n   a n y   i n f o r m a t i o n   t o   p o p u l a t e .4 �P=>
�P 
mesS= b  f�?@? b  f�ABA b  f�CDC b  f�EFE b  f}GHG b  fyIJI b  fsKLK b  foMNM m  fiOO �PP � T h e   n o t e   o f   a   p r o j e c t   s h o u l d   e n d   w i t h   a   l i s t   o f   p r o j e c t   p l a c e h o l d e r s ,   l i k e   N o  in�O�O &0 placeholderopener placeholderOpenerL m  orQQ �RR  R o o m N a m eJ o  sx�N�N &0 placeholdercloser placeholderCloserH m  y|SS �TT   F o  }��M�M &0 placeholderopener placeholderOpenerD m  ��UU �VV  C l i e n t N a m eB o  ���L�L &0 placeholdercloser placeholderCloser@ m  ��WW �XX �  ,   o r   t h e   p r o j e c t   s h o u l d   h a v e   a   s t a r t   o r   d u e   d a t e   t h a t   w i l l   b e   u s e d   t o   a d j u s t   t h e   d a t e s   o f   i t e m s   w i t h i n   t h e   p r o j e c t .> �KYZ
�K 
as AY m  ���J
�J EAlTwarNZ �I[\
�I 
btns[ J  ��]] ^�H^ m  ��__ �``  O K�H  \ �Ga�F
�G 
dflta m  ���E�E �F  2 b�Db L  ���C�C  �D  �`  �_    cdc l ���B�A�@�B  �A  �@  d efe r  ��ghg n ��iji I  ���?k�>�? "0 getreplacements getReplacementsk lml o  ���=�= "0 theplaceholders thePlaceholdersm n�<n J  ���;�;  �<  �>  j  f  ��h o      �:�: "0 thereplacements theReplacementsf opo l ��qrsq Z ��tu�9�8t l ��v�7�6v = ��wxw o  ���5�5 "0 thereplacements theReplacementsx m  ���4
�4 
msng�7  �6  u L  ���3�3  �9  �8  r  
 cancelled   s �yy    c a n c e l l e dp z{z l ���2�1�0�2  �1  �0  { |}| Z  �A~��~ l ����/�.� > ����� o  ���-�- 0 
theduedate 
theDueDate� m  ���,
�, 
msng�/  �.   k  ��� ��� r  ����� n ����� I  ���+��*�+ ,0 extractduedateprompt extractDueDatePrompt� ��)� o  ���(�( 0 thenote theNote�)  �*  �  f  ��� o      �'�' 0 duedateprompt dueDatePrompt� ��� r  ����� n ����� I  ���&��%�& *0 getdatedifferential getDateDifferential� ��� m  ���� ���  d u e� ��� o  ���$�$ 0 
theduedate 
theDueDate� ��#� o  ���"�" 0 duedateprompt dueDatePrompt�#  �%  �  f  ��� o      �!�! $0 datedifferential dateDifferential� �� � l ����� Z ������ l ������ = ����� o  ���� $0 datedifferential dateDifferential� m  ���
� 
msng�  �  � L  ��  �  �  �  
 cancelled   � ���    c a n c e l l e d�   � ��� l 
���� > 
��� o  
�� 0 thestartdate theStartDate� m  �
� 
msng�  �  � ��� k  7�� ��� r  &��� n "��� I  "���� *0 getdatedifferential getDateDifferential� ��� m  �� ��� 
 s t a r t� ��� o  �� 0 thestartdate theStartDate� ��� m  �
� 
msng�  �  �  f  � o      �� $0 datedifferential dateDifferential� ��� l '7���� Z '7����� l '.��
�	� = '.��� o  '*�� $0 datedifferential dateDifferential� m  *-�
� 
msng�
  �	  � L  13��  �  �  �  
 cancelled   � ���    c a n c e l l e d�  �  � r  :A��� m  :=�
� 
msng� o      �� $0 datedifferential dateDifferential} ��� l BB����  �  �  � ��� l BB� ���   � d ^ When debugging, it's handy to abort the script before any changes are made to the OF database   � ��� �   W h e n   d e b u g g i n g ,   i t ' s   h a n d y   t o   a b o r t   t h e   s c r i p t   b e f o r e   a n y   c h a n g e s   a r e   m a d e   t o   t h e   O F   d a t a b a s e� ��� Z  BP������� o  BG���� .0 abortafterinputchecks abortAfterInputChecks� L  JL����  ��  ��  � ��� l QQ��������  ��  ��  � ��� I Ql����
�� .coreclon****      � ****� l Q[������ n  Q[��� 1  W[��
�� 
valL� n  QW��� 4  RW���
�� 
cobj� m  UV���� � o  QR���� $0 theselecteditems theSelectedItems��  ��  � �����
�� 
insh� n  ^h��� 9  dh��
�� 
insl� 4 ^d���
�� 
FCSX� m  bc��������  � ��� r  mw��� 4 ms���
�� 
FCSX� m  qr������� o      ����  0 duplicateditem duplicatedItem� ��� n x���� I  y�������� 
0 notify  � ��� m  y|�� ��� & P o p u l a t i n g   T e m p l a t e� ��� b  |���� b  |���� m  |�� ��� Z D u p l i c a t i n g   a n d   p o p u l a t i n g   t h e   t e m p l a t e   f o r   � o  �����  0 theprojectname theProjectName� m  ���� ���  � ���� o  ������ 20 scriptstartnotification scriptStartNotification��  ��  �  f  xy� ��� l ����������  ��  ��  � ��� Q  ��� � r  �� J  �� �� l ������ e  �� n  ��	 1  ����
�� 
FCrt	 o  ������  0 duplicateditem duplicatedItem��  ��  ��   o      ���� 0 thetask theTask  R      ��

�� .ascrerr ****      � ****
 o      ���� 0 msg   ����
�� 
errn o      ���� 0 num  ��   Z  ���� = �� o  ������ 0 num   m  �������\ r  �� J  �� �� o  ������  0 duplicateditem duplicatedItem��   o      ���� 0 thetask theTask��   k  ��  I ��������
�� .sysobeepnull��� ��� long��  ��   �� R  ����
�� .ascrerr ****      � **** o  ������ 0 msg   ����
�� 
errn o  ������ 0 num  ��  ��  �  l ���� ��   &  set will autosave of it to false     �!! @ s e t   w i l l   a u t o s a v e   o f   i t   t o   f a l s e "#" n ��$%$ I  ����&���� *0 replaceplaceholders replacePlaceholders& '(' o  ������ 0 thetask theTask( )*) o  ������ "0 theplaceholders thePlaceholders* +,+ o  ������ "0 thereplacements theReplacements, -��- o  ������ $0 datedifferential dateDifferential��  ��  %  f  ��# ./. r  ��010 l ��2����2 I ����34�� &0 stripplaceholders stripPlaceholders3  f  ��4 ��5��
�� 
from5 o  ������ 0 thenote theNote��  ��  ��  1 o      ���� 0 thenote theNote/ 676 r  �898 l ��:����: n ��;<; I  ����=���� 0 replacetext replaceText= >?> o  ������ 0 thenote theNote? @A@ o  ������ "0 theplaceholders thePlaceholdersA B��B o  ������ "0 thereplacements theReplacements��  ��  <  f  ����  ��  9 o      ���� 0 thenote theNote7 CDC r  EFE o  ���� 0 thenote theNoteF n      GHG 1  ��
�� 
FCnoH o  ����  0 duplicateditem duplicatedItemD I��I l ��JK��  J % set will autosave of it to true   K �LL > s e t   w i l l   a u t o s a v e   o f   i t   t o   t r u e��   U 4   ��M
�� 
docuM m    ����  S NON n !PQP I  !��R���� 
0 notify  R STS m  UU �VV $ T e m p l a t e   P o p u l a t e dT WXW m  YY �ZZ � T h e   p r o j e c t   t e m p l a t e   h a s   b e e n   p o p u l a t e d .     Y o u  l l   f i n d   i t   a t   t h e   e n d   o f   t h e   p r o j e c t   l i s t i n g .X [��[ o  ���� 40 scriptfinishnotification scriptFinishNotification��  ��  Q  f  O \��\ l ""��������  ��  ��  ��   P m     ]]�                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  ��  ��   M ^_^ l     ��������  ��  ��  _ `a` i   $ 'bcb I      ��d���� 00 parseplaceholderstring parsePlaceholderStringd e��e o      ���� 0 	thestring 	theString��  ��  c k     5ff ghg r     iji n    klk 1    ��
�� 
txdll 1     ��
�� 
ascrj o      ���� 0 olddelim oldDelimh mnm r    opo o    ���� &0 placeholderopener placeholderOpenerp n     qrq 1    ��
�� 
txdlr 1    ��
�� 
ascrn sts r    uvu n    wxw 1    ��
�� 
restx n    yzy 2   ��
�� 
citmz o    ���� 0 	thestring 	theStringv o      ���� 0 
firstparse 
firstParset {|{ r    !}~} o    ���� &0 placeholdercloser placeholderCloser~ n     � 1     ��
�� 
txdl� 1    ��
�� 
ascr| ��� r   " ,��� I   " *������� &0 cleanplaceholders cleanPlaceholders� ��� o   # $���� 0 
firstparse 
firstParse� ���� J   $ &����  ��  ��  � o      ���� 0 	theresult 	theResult� ��� r   - 2��� o   - .���� 0 olddelim oldDelim� n     ��� 1   / 1��
�� 
txdl� 1   . /��
�� 
ascr� ���� L   3 5�� o   3 4���� 0 	theresult 	theResult��  a ��� l     �������  ��  �  � ��� l      �~���~  � S M assumes that AppleScript's text item delimiters is set to placeholderCloser    � ��� �   a s s u m e s   t h a t   A p p l e S c r i p t ' s   t e x t   i t e m   d e l i m i t e r s   i s   s e t   t o   p l a c e h o l d e r C l o s e r  � ��� i   ( +��� I      �}��|�} &0 cleanplaceholders cleanPlaceholders� ��� o      �{�{ 0 thelist theList� ��z� o      �y�y 	0 accum  �z  �|  � k     ;�� ��� Z    ���x�w� l    ��v�u� =    ��� o     �t�t 0 thelist theList� J    �s�s  �v  �u  � L    	�� o    �r�r 	0 accum  �x  �w  � ��� r    ��� n    ��� 4    �q�
�q 
cobj� m    �p�p � o    �o�o 0 thelist theList� o      �n�n 0 	firstitem 	firstItem� ��� r    ��� n    ��� 4    �m�
�m 
citm� m    �l�l � o    �k�k 0 	firstitem 	firstItem� o      �j�j 0 	firstitem 	firstItem� ��� Z    0���i�h� l   %��g�f� >   %��� l   #��e�d� I   #�c��b
�c .corecnte****       ****� n    ��� 2   �a
�a 
cha � o    �`�` 0 	firstitem 	firstItem�b  �e  �d  � m   # $�_�_  �g  �f  � r   ( ,��� o   ( )�^�^ 0 	firstitem 	firstItem� n      ���  ;   * +� o   ) *�]�] 	0 accum  �i  �h  � ��\� L   1 ;�� I   1 :�[��Z�[ &0 cleanplaceholders cleanPlaceholders� ��� n   2 5��� 1   3 5�Y
�Y 
rest� o   2 3�X�X 0 thelist theList� ��W� o   5 6�V�V 	0 accum  �W  �Z  �\  � ��� l     �U�T�S�U  �T  �S  � ��� i   , /��� I      �R��Q�R "0 getreplacements getReplacements� ��� o      �P�P "0 theplaceholders thePlaceholders� ��O� o      �N�N 	0 accum  �O  �Q  � k     F�� ��� Z    ���M�L� l    ��K�J� =    ��� o     �I�I "0 theplaceholders thePlaceholders� J    �H�H  �K  �J  � L    	�� o    �G�G 	0 accum  �M  �L  � ��� r    ��� n    ��� 4    �F�
�F 
cobj� m    �E�E � o    �D�D "0 theplaceholders thePlaceholders� o      �C�C  0 theplaceholder thePlaceholder� ��� Q    4���� O    *��� r    )��� I   '�B��
�B .sysodlogaskr        TEXT� b    ��� o    �A�A  0 theplaceholder thePlaceholder� m    �� ���  :� �@��
�@ 
dtxt� m     !�� ���  � �?��>
�? 
appr� m   " #�� ��� B E n t e r   r e p l a c e m e n t   f o r   p l a c e h o l d e r�>  � o      �=�= 	0 reply  � m    ���                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  � R      �<�;�:
�< .ascrerr ****      � ****�;  �:  � L   2 4�� m   2 3�9
�9 
msng�    r   5 ; l  5 8�8�7 n   5 8 1   6 8�6
�6 
ttxt o   5 6�5�5 	0 reply  �8  �7   n        ;   9 : o   8 9�4�4 	0 accum   	�3	 L   < F

 I   < E�2�1�2 "0 getreplacements getReplacements  n   = @ 1   > @�0
�0 
rest o   = >�/�/ "0 theplaceholders thePlaceholders �. o   @ A�-�- 	0 accum  �.  �1  �3  �  l     �,�+�*�,  �+  �*    i   0 3 I      �)�(�) *0 getdatedifferential getDateDifferential  o      �'�' 0 datekind dateKind  o      �&�& 0 originaldate originalDate �% o      �$�$ 0 extraprompt extraPrompt�%  �(   k     �  Z      !�#"  =    #$# o     �"�" 0 extraprompt extraPrompt$ m    �!
�! 
msng! r    	%&% m    '' �((  & o      � �  0 extraprompt extraPrompt�#  " r    )*) b    +,+ o    �
� 
ret , o    �� 0 extraprompt extraPrompt* o      �� 0 extraprompt extraPrompt -.- r    /0/ m    �
� boovfals0 o      �� 0 
validinput 
validInput. 121 r    343 m    55 �66  4 o      �� 0 	theanswer 	theAnswer2 787 W    �9:9 k     {;; <=< O     6>?> r   $ 5@A@ I  $ 3�BC
� .sysodlogaskr        TEXTB l  $ +D��D b   $ +EFE b   $ )GHG b   $ 'IJI m   $ %KK �LL  E n t e r  J o   % &�� 0 datekind dateKindH m   ' (MM �NN "   d a t e   f o r   p r o j e c tF o   ) *�� 0 extraprompt extraPrompt�  �  C �OP
� 
dtxtO o   , -�� 0 	theanswer 	theAnswerP �Q�
� 
apprQ m   . /RR �SS  E n t e r   D a t e�  A o      �� 0 thereply theReply? m     !TT�                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  = UVU Q   7 IWXYW r   : ?Z[Z n   : =\]\ 1   ; =�
� 
ttxt] o   : ;�� 0 thereply theReply[ o      �� 0 	theanswer 	theAnswerX R      ���

� .ascrerr ****      � ****�  �
  Y k   G I^^ _`_ l  G G�	ab�	  a   user cancelled   b �cc    u s e r   c a n c e l l e d` d�d L   G Iee m   G H�
� 
msng�  V fgf Q   J lhijh k   M ckk lml r   M Snon 4   M Q�p
� 
ldt p o   O P�� 0 	theanswer 	theAnswero o      �� 0 newdate newDatem qrq r   T _sts n   T Yuvu 1   U Y�
� 
timev o   T U�� 0 originaldate originalDatet n      wxw 1   Z ^�
� 
timex o   Y Z� �  0 newdate newDater y��y r   ` cz{z m   ` a��
�� boovtrue{ o      ���� 0 
validinput 
validInput��  i R      ������
�� .ascrerr ****      � ****��  ��  j l  k k��|}��  | "  probably a conversion error   } �~~ 8   p r o b a b l y   a   c o n v e r s i o n   e r r o rg �� Z  m {������� l  m o������ H   m o�� o   m n���� 0 
validinput 
validInput��  ��  � I  r w������
�� .sysobeepnull��� ��� long��  ��  ��  ��  ��  : o    ���� 0 
validinput 
validInput8 ���� L   � ��� l  � ������� \   � ���� o   � ����� 0 newdate newDate� o   � ����� 0 originaldate originalDate��  ��  ��   ��� l     ��������  ��  ��  � ��� i   4 7��� I      ������� *0 replaceplaceholders replacePlaceholders� ��� o      ���� 0 thetasks theTasks� ��� o      ���� "0 theplaceholders thePlaceholders� ��� o      ���� "0 thereplacements theReplacements� ���� o      ���� $0 datedifferential dateDifferential��  ��  � k     &�� ��� Z    ������� l    ������ =    ��� o     ���� 0 thetasks theTasks� J    ����  ��  ��  � L    	����  ��  ��  � ��� I    ������� >0 replaceplaceholdersinchildren replacePlaceholdersInChildren� ��� n    ��� 4    ���
�� 
cobj� m    ���� � o    ���� 0 thetasks theTasks� ��� o    ���� "0 theplaceholders thePlaceholders� ��� o    ���� "0 thereplacements theReplacements� ���� o    ���� $0 datedifferential dateDifferential��  ��  � ���� I    &������� *0 replaceplaceholders replacePlaceholders� ��� n    ��� 1    ��
�� 
rest� o    ���� 0 thetasks theTasks� ��� o     ���� "0 theplaceholders thePlaceholders� ��� o     !���� "0 thereplacements theReplacements� ���� o   ! "���� $0 datedifferential dateDifferential��  ��  ��  � ��� l     ��������  ��  ��  � ��� i   8 ;��� I      ������� >0 replaceplaceholdersinchildren replacePlaceholdersInChildren� ��� o      ���� 0 thetask theTask� ��� o      ���� "0 theplaceholders thePlaceholders� ��� o      ���� "0 thereplacements theReplacements� ���� o      ���� $0 datedifferential dateDifferential��  ��  � w     u��� k    u�� ��� r    	��� c    ��� n    ��� 1    ��
�� 
pnam� o    ���� 0 thetask theTask� m    ��
�� 
TEXT� o      ���� 0 oldname oldName� ��� Z   
 $������� E   
 ��� o   
 ���� 0 oldname oldName� o    ���� &0 placeholderopener placeholderOpener� r     ��� l   ������ n   ��� I    ������� 0 replacetext replaceText� ��� o    ���� 0 oldname oldName� ��� o    ���� "0 theplaceholders thePlaceholders� ���� o    ���� "0 thereplacements theReplacements��  ��  �  f    ��  ��  � n      ��� 1    ��
�� 
pnam� o    ���� 0 thetask theTask��  ��  � ��� r   % 2��� l  % .������ n  % .��� I   & .������� 0 
updatedate 
updateDate� ��� n   & )��� 1   ' )��
�� 
FCDd� o   & '���� 0 thetask theTask� ���� o   ) *���� $0 datedifferential dateDifferential��  ��  �  f   % &��  ��  � n      ��� 1   / 1��
�� 
FCDd� o   . /���� 0 thetask theTask� ��� r   3 @��� l  3 <������ n  3 <��� I   4 <������� 0 
updatedate 
updateDate� ��� n   4 7��� 1   5 7��
�� 
FCDs� o   4 5���� 0 thetask theTask� ���� o   7 8���� $0 datedifferential dateDifferential��  ��  �  f   3 4��  ��  � n      � � 1   = ?��
�� 
FCDs  o   < =���� 0 thetask theTask�  r   A F n   A D 1   B D��
�� 
FCno o   A B���� 0 thetask theTask o      ���� 0 oldnote oldNote  Z   G i	
����	 l  G V���� F   G V >  G J o   G H���� 0 oldnote oldNote m   H I��
�� 
msng E   M T o   M N���� 0 oldnote oldNote o   N S���� &0 placeholderopener placeholderOpener��  ��  
 r   Y e l  Y a���� n  Y a I   Z a������ 0 replacetext replaceText  o   Z [���� 0 oldnote oldNote  o   [ \���� "0 theplaceholders thePlaceholders �� o   \ ]���� "0 thereplacements theReplacements��  ��    f   Y Z��  ��   n       1   b d��
�� 
FCno o   a b���� 0 thetask theTask��  ��   �� n  j u !  I   k u��"��� *0 replaceplaceholders replacePlaceholders" #$# n   k n%&% 2  l n�~
�~ 
FCac& o   k l�}�} 0 thetask theTask$ '(' o   n o�|�| "0 theplaceholders thePlaceholders( )*) o   o p�{�{ "0 thereplacements theReplacements* +�z+ o   p q�y�y $0 datedifferential dateDifferential�z  �  !  f   j k��  ��                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  � ,-, l     �x�w�v�x  �w  �v  - ./. i   < ?010 I      �u2�t�u 0 replacetext replaceText2 343 o      �s�s 0 thetext theText4 565 o      �r�r "0 theplaceholders thePlaceholders6 7�q7 o      �p�p "0 thereplacements theReplacements�q  �t  1 k     U88 9:9 Z     ;<�o�n; l    =�m�l= =    >?> o     �k�k "0 theplaceholders thePlaceholders? J    �j�j  �m  �l  < L    	@@ o    �i�i 0 thetext theText�o  �n  : ABA r    CDC n   EFE 1    �h
�h 
txdlF 1    �g
�g 
ascrD o      �f�f 0 oldtid oldTIDB GHG r    &IJI b    $KLK b    MNM o    �e�e &0 placeholderopener placeholderOpenerN l   O�d�cO n    PQP 4    �bR
�b 
cobjR m    �a�a Q o    �`�` "0 theplaceholders thePlaceholders�d  �c  L o    #�_�_ &0 placeholdercloser placeholderCloserJ o      �^�^ (0 wrappedplaceholder wrappedPlaceholderH STS r   ' ,UVU o   ' (�]�] (0 wrappedplaceholder wrappedPlaceholderV n     WXW 1   ) +�\
�\ 
txdlX 1   ( )�[
�[ 
ascrT YZY r   - 2[\[ n   - 0]^] 2   . 0�Z
�Z 
citm^ o   - .�Y�Y 0 thetext theText\ o      �X�X 0 itemlist itemListZ _`_ r   3 ;aba n   3 7cdc 4   4 7�We
�W 
cobje m   5 6�V�V d o   3 4�U�U "0 thereplacements theReplacementsb n     fgf 1   8 :�T
�T 
txdlg 1   7 8�S
�S 
ascr` hih r   < Ajkj c   < ?lml o   < =�R�R 0 itemlist itemListm m   = >�Q
�Q 
TEXTk o      �P�P 0 
resulttext 
resultTexti non r   B Gpqp o   B C�O�O 0 oldtid oldTIDq n     rsr 1   D F�N
�N 
txdls 1   C D�M
�M 
ascro t�Lt L   H Uuu n  H Tvwv I   I T�Kx�J�K 0 replacetext replaceTextx yzy o   I J�I�I 0 
resulttext 
resultTextz {|{ n   J M}~} 1   K M�H
�H 
rest~ o   J K�G�G "0 theplaceholders thePlaceholders| �F n   M P��� 1   N P�E
�E 
rest� o   M N�D�D "0 thereplacements theReplacements�F  �J  w  f   H I�L  / ��� l     �C�B�A�C  �B  �A  � ��� i   @ C��� I      �@��?�@ 0 
updatedate 
updateDate� ��� o      �>�> 0 originaldate originalDate� ��=� o      �<�< $0 datedifferential dateDifferential�=  �?  � k     �� ��� Z    ���;�:� l    ��9�8� G     ��� =    ��� o     �7�7 0 originaldate originalDate� m    �6
�6 
msng� =   	��� o    �5�5 $0 datedifferential dateDifferential� m    �4
�4 
msng�9  �8  � L    �� m    �3
�3 
msng�;  �:  � ��� r    ��� [    ��� o    �2�2 0 originaldate originalDate� o    �1�1 $0 datedifferential dateDifferential� o      �0�0 0 newdate newDate� ��/� L    �� o    �.�. 0 newdate newDate�/  � ��� l     �-�,�+�-  �,  �+  � ��� i   D G��� I      �*�)��* &0 stripplaceholders stripPlaceholders�)  � �(��'
�( 
from� o      �&�& 0 thenote theNote�'  � k     %�� ��� Z    ���%�$� l    	��#�"� =    	��� l    ��!� � I    ���
� .corecnte****       ****� n     ��� 2   �
� 
cpar� o     �� 0 thenote theNote�  �!  �   � m    �� �#  �"  � L    �� m    �� ���  �%  �$  � ��� r    "��� n     ��� 7     ���
� 
ctxt� 4    ��
� 
cpar� m    �� � 4    ��
� 
cpar� m    ����� o    �� 0 thenote theNote� o      �� 0 	noteparts 	noteParts� ��� L   # %�� o   # $�� 0 	noteparts 	noteParts�  � ��� l     ����  �  �  � ��� i   H K��� I      ���� ,0 extractduedateprompt extractDueDatePrompt� ��� o      �� 0 thenote theNote�  �  � k     *�� ��� r     ��� n     ��� 2    �

�
 
cpar� o     �	�	 0 thenote theNote� o      �� 0 thepars thePars� ��� X    '���� Z    "����� C    ��� o    �� 0 apar aPar� m    �� ���  D u e   D a t e   i s� L    �� o    �� 0 apar aPar�  �  � 0 apar aPar� o   	 
�� 0 thepars thePars� ��� L   ( *�� m   ( )� 
�  
msng�  � ��� l     ��������  ��  ��  � ��� l      ������  �
	Uses Growl to display a notification message.
	theTitle � a string giving the notification title
	theDescription � a string describing the notification event
	theNotificationKind � a string giving the notification kind (must be an element of allNotifications)
   � ��� 
 	 U s e s   G r o w l   t o   d i s p l a y   a   n o t i f i c a t i o n   m e s s a g e . 
 	 t h e T i t l e      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   t i t l e 
 	 t h e D e s c r i p t i o n      a   s t r i n g   d e s c r i b i n g   t h e   n o t i f i c a t i o n   e v e n t 
 	 t h e N o t i f i c a t i o n K i n d      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   k i n d   ( m u s t   b e   a n   e l e m e n t   o f   a l l N o t i f i c a t i o n s ) 
� ��� i   L O��� I      ������� 
0 notify  � ��� o      ���� 0 thetitle theTitle� ��� o      ����  0 thedescription theDescription� ���� o      ���� *0 thenotificationkind theNotificationKind��  ��  � O     4��� k    3�� ��� I   !�����
�� .registernull��� ��� null��  � ����
�� 
appl� o    ���� 0 growlappname growlAppName� ����
�� 
anot� o    ���� $0 allnotifications allNotifications� ����
�� 
dnot� o    ���� ,0 defaultnotifications defaultNotifications� �����
�� 
iapp� o    ���� 00 iconloaningapplication iconLoaningApplication��  � ���� I  " 3�����
�� .notifygrnull��� ��� null��  � �� 
�� 
name  o   $ %���� *0 thenotificationkind theNotificationKind ��
�� 
titl o   & '���� 0 thetitle theTitle ��
�� 
appl o   ( -���� 0 growlappname growlAppName ����
�� 
desc o   . /����  0 thedescription theDescription��  ��  � m     2                                                                                  GRRR   alis    �  Mac Book Pro               �WXfH+   8 �GrowlHelperApp.app                                              8 ��n̥        ����  	                	Resources     �W��      �o�     8 � 8 � 8 �  �     YMac Book Pro:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c   B o o k   P r o  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  � 	 l     ��������  ��  ��  	 
��
 l     ��������  ��  ��  ��       ��     % * ;������   ���������������������������������������������� &0 placeholderopener placeholderOpener�� &0 placeholdercloser placeholderCloser�� 0 growlappname growlAppName�� 20 scriptstartnotification scriptStartNotification�� 40 scriptfinishnotification scriptFinishNotification�� ,0 defaultnotifications defaultNotifications�� $0 allnotifications allNotifications�� 00 iconloaningapplication iconLoaningApplication�� .0 abortafterinputchecks abortAfterInputChecks�� 0 indebugmode inDebugMode�� 00 parseplaceholderstring parsePlaceholderString�� &0 cleanplaceholders cleanPlaceholders�� "0 getreplacements getReplacements�� *0 getdatedifferential getDateDifferential�� *0 replaceplaceholders replacePlaceholders�� >0 replaceplaceholdersinchildren replacePlaceholdersInChildren�� 0 replacetext replaceText�� 0 
updatedate 
updateDate�� &0 stripplaceholders stripPlaceholders�� ,0 extractduedateprompt extractDueDatePrompt�� 
0 notify  
�� .aevtoappnull  �   � **** ����    * ����    * %
�� boovfals
�� boovfals ��c�������� 00 parseplaceholderstring parsePlaceholderString�� ����   ���� 0 	thestring 	theString��   ���������� 0 	thestring 	theString�� 0 olddelim oldDelim�� 0 
firstparse 
firstParse�� 0 	theresult 	theResult ����������
�� 
ascr
�� 
txdl
�� 
citm
�� 
rest�� &0 cleanplaceholders cleanPlaceholders�� 6��,E�Ob   ��,FO��-�,E�Ob  ��,FO*�jvl+ E�O���,FO� ������� ���� &0 cleanplaceholders cleanPlaceholders�� ��!�� !  ������ 0 thelist theList�� 	0 accum  ��   �������� 0 thelist theList�� 	0 accum  �� 0 	firstitem 	firstItem  ������������
�� 
cobj
�� 
citm
�� 
cha 
�� .corecnte****       ****
�� 
rest�� &0 cleanplaceholders cleanPlaceholders�� <�jv  �Y hO��k/E�O��k/E�O��-j j 	��6FY hO*��,�l+  �������"#���� "0 getreplacements getReplacements�� ��$�� $  ������ "0 theplaceholders thePlaceholders�� 	0 accum  ��  " ���������� "0 theplaceholders thePlaceholders�� 	0 accum  ��  0 theplaceholder thePlaceholder�� 	0 reply  # ��������������������������
�� 
cobj
�� 
dtxt
�� 
appr�� 
�� .sysodlogaskr        TEXT��  ��  
�� 
msng
�� 
ttxt
�� 
rest�� "0 getreplacements getReplacements�� G�jv  �Y hO��k/E�O � ��%����� E�UW 	X 	 
�O��,�6FO*��,�l+  ������%&���� *0 getdatedifferential getDateDifferential�� ��'�� '  �������� 0 datekind dateKind�� 0 originaldate originalDate�� 0 extraprompt extraPrompt��  % ��~�}�|�{�z�y� 0 datekind dateKind�~ 0 originaldate originalDate�} 0 extraprompt extraPrompt�| 0 
validinput 
validInput�{ 0 	theanswer 	theAnswer�z 0 thereply theReply�y 0 newdate newDate& �x'�w5TKM�v�uR�t�s�r�q�p�o�n�m
�x 
msng
�w 
ret 
�v 
dtxt
�u 
appr�t 
�s .sysodlogaskr        TEXT
�r 
ttxt�q  �p  
�o 
ldt 
�n 
time
�m .sysobeepnull��� ��� long�� ���  �E�Y ¢%E�OfE�O�E�O eh�� �%�%�%���� E�UO 
��,E�W 	X  �O *�/E�O�a ,�a ,FOeE�W X  hO� 
*j Y h[OY��O�� �l��k�j()�i�l *0 replaceplaceholders replacePlaceholders�k �h*�h *  �g�f�e�d�g 0 thetasks theTasks�f "0 theplaceholders thePlaceholders�e "0 thereplacements theReplacements�d $0 datedifferential dateDifferential�j  ( �c�b�a�`�c 0 thetasks theTasks�b "0 theplaceholders thePlaceholders�a "0 thereplacements theReplacements�` $0 datedifferential dateDifferential) �_�^�]�\�[
�_ 
cobj�^ �] >0 replaceplaceholdersinchildren replacePlaceholdersInChildren
�\ 
rest�[ *0 replaceplaceholders replacePlaceholders�i '�jv  hY hO*��k/����+ O*��,����+  �Z��Y�X+,�W�Z >0 replaceplaceholdersinchildren replacePlaceholdersInChildren�Y �V-�V -  �U�T�S�R�U 0 thetask theTask�T "0 theplaceholders thePlaceholders�S "0 thereplacements theReplacements�R $0 datedifferential dateDifferential�X  + �Q�P�O�N�M�L�Q 0 thetask theTask�P "0 theplaceholders thePlaceholders�O "0 thereplacements theReplacements�N $0 datedifferential dateDifferential�M 0 oldname oldName�L 0 oldnote oldNote, ��K�J�I�H�G�F�E�D�C�B�A�@
�K 
pnam
�J 
TEXT�I 0 replacetext replaceText
�H 
FCDd�G 0 
updatedate 
updateDate
�F 
FCDs
�E 
FCno
�D 
msng
�C 
bool
�B 
FCac�A �@ *0 replaceplaceholders replacePlaceholders�W v�Z��,�&E�O�b    )���m+ ��,FY hO)��,�l+ ��,FO)��,�l+ ��,FO��,E�O��	 �b   �& )���m+ ��,FY hO)��-����+  �?1�>�=./�<�? 0 replacetext replaceText�> �;0�; 0  �:�9�8�: 0 thetext theText�9 "0 theplaceholders thePlaceholders�8 "0 thereplacements theReplacements�=  . �7�6�5�4�3�2�1�7 0 thetext theText�6 "0 theplaceholders thePlaceholders�5 "0 thereplacements theReplacements�4 0 oldtid oldTID�3 (0 wrappedplaceholder wrappedPlaceholder�2 0 itemlist itemList�1 0 
resulttext 
resultText/ �0�/�.�-�,�+�*
�0 
ascr
�/ 
txdl
�. 
cobj
�- 
citm
�, 
TEXT
�+ 
rest�* 0 replacetext replaceText�< V�jv  �Y hO��,E�Ob   ��k/%b  %E�O���,FO��-E�O��k/��,FO��&E�O���,FO)���,��,m+  �)��(�'12�&�) 0 
updatedate 
updateDate�( �%3�% 3  �$�#�$ 0 originaldate originalDate�# $0 datedifferential dateDifferential�'  1 �"�!� �" 0 originaldate originalDate�! $0 datedifferential dateDifferential�  0 newdate newDate2 ��
� 
msng
� 
bool�& �� 
 �� �& �Y hO��E�O� ����45�� &0 stripplaceholders stripPlaceholders�  � ���
� 
from� 0 thenote theNote�  4 ��� 0 thenote theNote� 0 	noteparts 	noteParts5 �����
� 
cpar
� .corecnte****       ****
� 
ctxt���� &��-j k  �Y hO�[�\[�k/\��/2E�O� ����67�� ,0 extractduedateprompt extractDueDatePrompt� �8� 8  �� 0 thenote theNote�  6 �
�	��
 0 thenote theNote�	 0 thepars thePars� 0 apar aPar7 ������
� 
cpar
� 
kocl
� 
cobj
� .corecnte****       ****
� 
msng� +��-E�O  �[��l kh �� �Y h[OY��O� ���� 9:��� 
0 notify  � ��;�� ;  �������� 0 thetitle theTitle��  0 thedescription theDescription�� *0 thenotificationkind theNotificationKind�   9 �������� 0 thetitle theTitle��  0 thedescription theDescription�� *0 thenotificationkind theNotificationKind: ��������������������
�� 
appl
�� 
anot
�� 
dnot
�� 
iapp�� 
�� .registernull��� ��� null
�� 
name
�� 
titl
�� 
desc
�� .notifygrnull��� ��� null�� 5� 1*�b  �b  �b  �b  � O*���b  �� 
U ��<����=>��
�� .aevtoappnull  �   � ****< k    $??  L����  ��  ��  = ������ 0 msg  �� 0 num  > W]������ h o�� s������������������ � � � ��������������� � � ��� ���������������������������������9;OQSUW_�����������������������������������@��������������UY
�� 
docu
�� 
FCdw
�� 
FCvm
�� 
mesS
�� 
as A
�� EAlTwarN�� 
�� .sysodisAaleR        TEXT
�� 
FCcn
�� 
OTst�� $0 theselecteditems theSelectedItems
�� .corecnte****       ****
�� 
FCSt
�� 
cobj
�� 
valL�� 0 selecteditem selectedItem
�� 
pnam��  0 theprojectname theProjectName
�� 
pcls
�� 
FCpr
�� 
btns
�� 
dflt�� 
�� 
FCno�� 0 thenote theNote�� "0 theplaceholders thePlaceholders
�� 
cpar�� ,0 theplaceholderstring thePlaceholderString�� 00 parseplaceholderstring parsePlaceholderString��  ��  
�� 
FCDs�� 0 thestartdate theStartDate
�� 
FCDd�� 0 
theduedate 
theDueDate
�� 
msng
�� 
bool�� "0 getreplacements getReplacements�� "0 thereplacements theReplacements�� ,0 extractduedateprompt extractDueDatePrompt�� 0 duedateprompt dueDatePrompt�� *0 getdatedifferential getDateDifferential�� $0 datedifferential dateDifferential
�� 
insh
�� 
FCSX
�� 
insl
�� .coreclon****      � ****��  0 duplicateditem duplicatedItem�� 
0 notify  
�� 
FCrt�� 0 thetask theTask�� 0 msg  @ ������
�� 
errn�� 0 num  ��  ���\
�� .sysobeepnull��� ��� long
�� 
errn�� *0 replaceplaceholders replacePlaceholders
�� 
from�� &0 stripplaceholders stripPlaceholders�� 0 replacetext replaceText��%�!*�k/*�k/ :*�,� ������ OhY hO*�,�-E�O�j k *a ,�-E�Y hUO�j k a �a ��� OhY hO�j k a �a ��� OhY hO�a k/a ,E` O�a k/a ,E` O_ a ,a  +a _ %a %�a ��a a  kva !ka " OhY hO_ a #,E` $OjvE` %O _ $a &i/E` 'O)_ 'k+ (E` %W X ) *hO_ a +,E` ,O_ a -,E` .O_ ,a / 	 _ .a / a 0&	 _ %j j a 0& Sa 1_ %a 2%�a 3b   %a 4%b  %a 5%b   %a 6%b  %a 7%��a a 8kva !ka " OhY hO)_ %jvl+ 9E` :O_ :a /  hY hO_ .a / 5)_ $k+ ;E` <O)a =_ ._ <m+ >E` ?O_ ?a /  hY hY 9_ ,a / ()a @_ ,a /m+ >E` ?O_ ?a /  hY hY 	a /E` ?Ob   hY hO�a k/a ,a A*a Bi/a C4l DO*a Bi/E` EO)a Fa G_ %a H%b  m+ IO _ Ea J,EkvE` KW )X L M�a N  _ EkvE` KY *j OO)a P�l�O)_ K_ %_ :_ ?�+ QO)a R_ $l SE` $O)_ $_ %_ :m+ TE` $O_ $_ Ea #,FOPUO)a Ua Vb  m+ IOPU ascr  ��ޭ