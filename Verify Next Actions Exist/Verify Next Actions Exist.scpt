FasdUAS 1.101.10   ��   ��    k             l      ��  ��   ��
	This script scans all projects and action groups in the front OmniFocus document identifying any that
	lack a next action.
	
	version 0.5, by Curt Clifton
	
	Copyright � 2007-2008, Curtis Clifton
	
	All rights reserved.
	
	Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:
	
		� Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.
		
		� Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.
		
	THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
	
	version 0.5.2: Added a script to remove suffix and complete the item
	version 0.5.1: Added a script to remove suffix to the package
	version 0.5: Move tag string to be a suffix rather than a prefix
	version 0.4.1: Removed sometimes-problematic use of 'activate' command
	version 0.4: Doesn't flag singleton holding projects as missing next actions even if they are empty
	version 0.3: Limited list of next-action-lacking projects in the dialog to 10.  More than 10 results in a dialog giving the number of such projects (along with the usual identifying-string instructions from the previous release).
	version 0.2: Added identifying string to offending projects based on idea from spiralocean.  Fixed bug where top-level projects without any actions were omitted.
	version 0.1: Original release
     � 	 	� 
 	 T h i s   s c r i p t   s c a n s   a l l   p r o j e c t s   a n d   a c t i o n   g r o u p s   i n   t h e   f r o n t   O m n i F o c u s   d o c u m e n t   i d e n t i f y i n g   a n y   t h a t 
 	 l a c k   a   n e x t   a c t i o n . 
 	 
 	 v e r s i o n   0 . 5 ,   b y   C u r t   C l i f t o n 
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
 	 v e r s i o n   0 . 5 . 2 :   A d d e d   a   s c r i p t   t o   r e m o v e   s u f f i x   a n d   c o m p l e t e   t h e   i t e m 
 	 v e r s i o n   0 . 5 . 1 :   A d d e d   a   s c r i p t   t o   r e m o v e   s u f f i x   t o   t h e   p a c k a g e 
 	 v e r s i o n   0 . 5 :   M o v e   t a g   s t r i n g   t o   b e   a   s u f f i x   r a t h e r   t h a n   a   p r e f i x 
 	 v e r s i o n   0 . 4 . 1 :   R e m o v e d   s o m e t i m e s - p r o b l e m a t i c   u s e   o f   ' a c t i v a t e '   c o m m a n d 
 	 v e r s i o n   0 . 4 :   D o e s n ' t   f l a g   s i n g l e t o n   h o l d i n g   p r o j e c t s   a s   m i s s i n g   n e x t   a c t i o n s   e v e n   i f   t h e y   a r e   e m p t y 
 	 v e r s i o n   0 . 3 :   L i m i t e d   l i s t   o f   n e x t - a c t i o n - l a c k i n g   p r o j e c t s   i n   t h e   d i a l o g   t o   1 0 .     M o r e   t h a n   1 0   r e s u l t s   i n   a   d i a l o g   g i v i n g   t h e   n u m b e r   o f   s u c h   p r o j e c t s   ( a l o n g   w i t h   t h e   u s u a l   i d e n t i f y i n g - s t r i n g   i n s t r u c t i o n s   f r o m   t h e   p r e v i o u s   r e l e a s e ) . 
 	 v e r s i o n   0 . 2 :   A d d e d   i d e n t i f y i n g   s t r i n g   t o   o f f e n d i n g   p r o j e c t s   b a s e d   o n   i d e a   f r o m   s p i r a l o c e a n .     F i x e d   b u g   w h e r e   t o p - l e v e l   p r o j e c t s   w i t h o u t   a n y   a c t i o n s   w e r e   o m i t t e d . 
 	 v e r s i o n   0 . 1 :   O r i g i n a l   r e l e a s e 
   
  
 l     ��������  ��  ��        j     �� �� *0 lackinglistingdelim lackingListingDelim  l     ����  b         o     ��
�� 
ret   m       �            "  ��  ��        j    �� �� "0 missingnasuffix missingNASuffix  m       �    M i s s i n g   N A      j    
�� �� (0 missingnadelimiter missingNADelimiter  m    	   �          l     ��������  ��  ��       !   l      �� " #��   " M G
	The following properties are used for script notification via Growl.
    # � $ $ � 
 	 T h e   f o l l o w i n g   p r o p e r t i e s   a r e   u s e d   f o r   s c r i p t   n o t i f i c a t i o n   v i a   G r o w l . 
 !  % & % j    �� '�� 0 growlappname growlAppName ' m     ( ( � ) )  C u r t ' s   S c r i p t s &  * + * j    �� ,�� 20 scriptstartnotification scriptStartNotification , m     - - � . .  S c r i p t   B e g a n +  / 0 / j    �� 1�� 40 scriptfinishnotification scriptFinishNotification 1 m     2 2 � 3 3   S c r i p t   C o m p l e t e d 0  4 5 4 j    �� 6�� ,0 defaultnotifications defaultNotifications 6 J     7 7  8�� 8 o    ���� 40 scriptfinishnotification scriptFinishNotification��   5  9 : 9 j    �� ;�� $0 allnotifications allNotifications ; b     < = < o    ���� ,0 defaultnotifications defaultNotifications = J     > >  ?�� ? o    ���� 20 scriptstartnotification scriptStartNotification��   :  @ A @ j     "�� B�� 00 iconloaningapplication iconLoaningApplication B m     ! C C � D D  O m n i F o c u s . a p p A  E F E l     ��������  ��  ��   F  G H G l     I���� I n     J K J I    �� L���� 
0 notify   L  M N M m     O O � P P 2 C h e c k i n g   f o r   N e x t   A c t i o n s N  Q R Q m     S S � T T � S c a n n i n g   a l l   p r o j e c t s   a n d   a c t i o n   g r o u p s   f o r   a n y   t h a t   l a c k   a   n e x t   a c t i o n R  U�� U o    ���� 20 scriptstartnotification scriptStartNotification��  ��   K  f     ��  ��   H  V W V l   � X���� X O    � Y Z Y O    � [ \ [ k    � ] ]  ^ _ ^ r     ` a ` 2    ��
�� 
FCSX a o      ���� 0 thesections theSections _  b c b r    ( d e d n   & f g f I    &�� h���� ,0 accumulatemissingnas accumulateMissingNAs h  i j i o     ���� 0 thesections theSections j  k�� k J     "����  ��  ��   g  f     e o      ���� (0 lackingnextactions lackingNextActions c  l�� l Z   ) � m n�� o m l  ) - p���� p =  ) - q r q o   ) *���� (0 lackingnextactions lackingNextActions r J   * ,����  ��  ��   n n  0 < s t s I   1 <�� u���� 
0 notify   u  v w v m   1 2 x x � y y   C o n g r a t u l a t i o n s ! w  z { z m   2 3 | | � } } � N e x t   a c t i o n s   a r e   i d e n t i f i e d   f o r   a l l   a c t i v e   p r o j e c t s   a n d   s u b p r o j e c t s . {  ~�� ~ o   3 8���� 40 scriptfinishnotification scriptFinishNotification��  ��   t  f   0 1��   o k   ? �    � � � Z   ? � � ��� � � l  ? F ����� � ?   ? F � � � l  ? D ����� � I  ? D�� ���
�� .corecnte****       **** � o   ? @���� (0 lackingnextactions lackingNextActions��  ��  ��   � m   D E���� 
��  ��   � r   I T � � � b   I R � � � b   I P � � � m   I J � � � � � : N e x t   a c t i o n s   a r e   m i s s i n g   f o r   � l  J O ����� � I  J O�� ���
�� .corecnte****       **** � o   J K���� (0 lackingnextactions lackingNextActions��  ��  ��   � m   P Q � � � � � >   a c t i v e   p r o j e c t s   o r   s u b p r o j e c t s � o      ���� 0 msg  ��   � k   W � � �  � � � r   W b � � � n  W ^ � � � 1   Z ^��
�� 
txdl � 1   W Z��
�� 
ascr � o      ���� 0 olddelim oldDelim �  � � � r   c p � � � o   c h���� *0 lackinglistingdelim lackingListingDelim � n      � � � 1   k o��
�� 
txdl � 1   h k��
�� 
ascr �  � � � r   q z � � � l  q v ����� � c   q v � � � o   q r���� (0 lackingnextactions lackingNextActions � m   r u��
�� 
ctxt��  ��   � o      ����  0 lackinglisting lackingListing �  � � � r   { � � � � o   { ~���� 0 olddelim oldDelim � n      � � � 1   � ���
�� 
txdl � 1   ~ ���
�� 
ascr �  ��� � r   � � � � � b   � � � � � b   � � � � � m   � � � � � � � � N e x t   a c t i o n s   a r e   m i s s i n g   f o r   t h e   f o l l o w i n g   a c t i v e   p r o j e c t s   o r   s u b p r o j e c t s : � o   � ����� *0 lackinglistingdelim lackingListingDelim � o   � �����  0 lackinglisting lackingListing � o      ���� 0 msg  ��   �  ��� � I  � ��� � �
�� .sysodisAaleR        TEXT � m   � � � � � � � ( M i s s i n g   N e x t   A c t i o n s � �� � �
�� 
mesS � l  � � ����� � b   � � � � � b   � � � � � b   � � � � � b   � � � � � o   � ����� 0 msg   � o   � ���
�� 
ret  � m   � � � � � � � 2 S e a r c h   a l l   p r o j e c t s   f o r   " � o   � ����� "0 missingnasuffix missingNASuffix � m   � � � � � � � . "   t o   f i n d   t h e m   q u i c k l y .��  ��   � �� ���
�� 
btns � J   � � � �  ��� � m   � � � � � � �  D r a t��  ��  ��  ��   \ 4   �� �
�� 
docu � m    ����  Z m     � ��                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  ��  ��   W  � � � l     ��������  ��  ��   �  � � � l      �� � ���   � 
	Recurses over the tree, accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theSections: a list of folders, projects, and tasks
	accum: the items lacking next actions that have been found so far 
    � � � �(   
 	 R e c u r s e s   o v e r   t h e   t r e e ,   a c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e S e c t i o n s :   a   l i s t   o f   f o l d e r s ,   p r o j e c t s ,   a n d   t a s k s 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
 �  � � � i   # & � � � I      �� ����� ,0 accumulatemissingnas accumulateMissingNAs �  � � � o      ���� 0 thesections theSections �  ��� � o      ���� 	0 accum  ��  ��   � k     ! � �  � � � Z     � ����� � l     ����� � =     � � � o     ���� 0 thesections theSections � J    ����  ��  ��   � L    	 � � o    ���� 	0 accum  ��  ��   �  ��� � L    ! � � I     �� ����� ,0 accumulatemissingnas accumulateMissingNAs �  � � � n     � � � 1    ��
�� 
rest � o    ���� 0 thesections theSections �  ��� � I    �� ����� 80 accumulatemissingnashelper accumulateMissingNAsHelper �  � � � n     � � � 4    �� �
�� 
cobj � m    ����  � o    ���� 0 thesections theSections �  �� � o    �~�~ 	0 accum  �  ��  ��  ��  ��   �  � � � l     �}�|�{�}  �|  �{   �  � � � l      �z � �z   �# 
	Recurses over the tree rooted at the given item, accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theItem: a folder, project, or task
	accum: the items lacking next actions that have been found so far 
     �:   
 	 R e c u r s e s   o v e r   t h e   t r e e   r o o t e d   a t   t h e   g i v e n   i t e m ,   a c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e I t e m :   a   f o l d e r ,   p r o j e c t ,   o r   t a s k 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
 �  i   ' * I      �y�x�y 80 accumulatemissingnashelper accumulateMissingNAsHelper  o      �w�w 0 theitem theItem 	�v	 o      �u�u 	0 accum  �v  �x   w     1

 Z    1 l   �t�s =    n     1    �r
�r 
pcls o    �q�q 0 theitem theItem m    �p
�p 
FCpr�t  �s   L   
  n  
  I    �o�n�o :0 accumulatemissingnasproject accumulateMissingNAsProject  o    �m�m 0 theitem theItem �l o    �k�k 	0 accum  �l  �n    f   
   l   �j�i =     n    !"! 1    �h
�h 
pcls" o    �g�g 0 theitem theItem  m    �f
�f 
FCAr�j  �i   #�e# L    %$$ n   $%&% I    $�d'�c�d 80 accumulatemissingnasfolder accumulateMissingNAsFolder' ()( o    �b�b 0 theitem theItem) *�a* o     �`�` 	0 accum  �a  �c  &  f    �e   L   ( 1++ n  ( 0,-, I   ) 0�_.�^�_ 40 accumulatemissingnastask accumulateMissingNAsTask. /0/ o   ) *�]�] 0 theitem theItem0 121 m   * +�\
�\ boovfals2 3�[3 o   + ,�Z�Z 	0 accum  �[  �^  -  f   ( )�                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��   454 l     �Y�X�W�Y  �X  �W  5 676 l      �V89�V  8 
	Recurses over the tree rooted at the given project, accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theProject: a project
	accum: the items lacking next actions that have been found so far 
   9 �::$   
 	 R e c u r s e s   o v e r   t h e   t r e e   r o o t e d   a t   t h e   g i v e n   p r o j e c t ,   a c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e P r o j e c t :   a   p r o j e c t 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
7 ;<; i   + .=>= I      �U?�T�U :0 accumulatemissingnasproject accumulateMissingNAsProject? @A@ o      �S�S 0 
theproject 
theProjectA B�RB o      �Q�Q 	0 accum  �R  �T  > w     /CDC k    /EE FGF O    HIH Z   JK�P�OJ l   L�N�ML G    MNM >   OPO 1    	�L
�L 
FCPsP m   	 
�K
�K FCPsFCPaN =   QRQ 1    �J
�J 
FC.AR m    �I
�I boovtrue�N  �M  K L    SS o    �H�H 	0 accum  �P  �O  I o    �G�G 0 
theproject 
theProjectG TUT r     %VWV n     #XYX 1   ! #�F
�F 
FCrtY o     !�E�E 0 
theproject 
theProjectW o      �D�D 0 theroottask theRootTaskU Z�CZ L   & /[[ n  & .\]\ I   ' .�B^�A�B 40 accumulatemissingnastask accumulateMissingNAsTask^ _`_ o   ' (�@�@ 0 theroottask theRootTask` aba m   ( )�?
�? boovtrueb c�>c o   ) *�=�= 	0 accum  �>  �A  ]  f   & '�C  D�                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  < ded l     �<�;�:�<  �;  �:  e fgf l      �9hi�9  hNH 
	Recurses over the tree rooted at the given task, accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theTask: a task
	isProjectRoot: true iff theTask is the root task of a project
	accum: the items lacking next actions that have been found so far 
   i �jj�   
 	 R e c u r s e s   o v e r   t h e   t r e e   r o o t e d   a t   t h e   g i v e n   t a s k ,   a c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e T a s k :   a   t a s k 
 	 i s P r o j e c t R o o t :   t r u e   i f f   t h e T a s k   i s   t h e   r o o t   t a s k   o f   a   p r o j e c t 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
g klk i   / 2mnm I      �8o�7�8 40 accumulatemissingnastask accumulateMissingNAsTasko pqp o      �6�6 0 thetask theTaskq rsr o      �5�5 0 isprojectroot isProjectRoots t�4t o      �3�3 	0 accum  �4  �7  n w     �uvu O    �wxw k    yy z{z r    |}| G    ~~ o    �2�2 0 isprojectroot isProjectRoot ?   
 ��� l  
 ��1�0� I  
 �/��.
�/ .corecnte****       ****� 2  
 �-
�- 
FCac�.  �1  �0  � m    �,�,  } o      �+�+ 80 isaprojectorsubprojecttask isAProjectOrSubprojectTask{ ��� Z   ,���*�)� l   #��(�'� G    #��� 1    �&
�& 
FCcd� H    !�� o     �%�% 80 isaprojectorsubprojecttask isAProjectOrSubprojectTask�(  �'  � L   & (�� o   & '�$�$ 	0 accum  �*  �)  � ��� r   - ;��� 6  - 9��� 2   - 0�#
�# 
FCac� =  1 8��� 1   2 4�"
�" 
FCcd� m   5 7�!
�! boovfals� o      � �  ,0 incompletechildtasks incompleteChildTasks� ��� Z   < ����� l  < C���� =  < C��� l  < A���� I  < A���
� .corecnte****       ****� o   < =�� ,0 incompletechildtasks incompleteChildTasks�  �  �  � m   A B��  �  �  � k   F t�� ��� r   F L��� 1   F I�
� 
pnam� n      ���  ;   J K� o   I J�� 	0 accum  � ��� l  M M����  � � � The following idea of tagging the items with an identifying string is due to user spiralocean on the OmniFocus Extras forum and OmniGroup.com:   � ���   T h e   f o l l o w i n g   i d e a   o f   t a g g i n g   t h e   i t e m s   w i t h   a n   i d e n t i f y i n g   s t r i n g   i s   d u e   t o   u s e r   s p i r a l o c e a n   o n   t h e   O m n i F o c u s   E x t r a s   f o r u m   a n d   O m n i G r o u p . c o m :� ��� Z   M q����� l  M W���� H   M W�� D   M V��� 1   M P�
� 
pnam� o   P U�� "0 missingnasuffix missingNASuffix�  �  � r   Z m��� l  Z i���� b   Z i��� b   Z c��� 1   Z ]�

�
 
pnam� o   ] b�	�	 (0 missingnadelimiter missingNADelimiter� o   c h�� "0 missingnasuffix missingNASuffix�  �  � 1   i l�
� 
pnam�  �  � ��� L   r t�� o   r s�� 	0 accum  �  �  � L   w �� n  w ~��� I   x ~���� ,0 accumulatemissingnas accumulateMissingNAs� ��� o   x y�� ,0 incompletechildtasks incompleteChildTasks� ��� o   y z� �  	0 accum  �  �  �  f   w x�  x o    ���� 0 thetask theTaskv�                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  l ��� l     ��������  ��  ��  � ��� l      ������  � 
	Recurses over the tree rooted at the given folder, accumulates a list of items that are:
		� not complete and 
		� have subtasks, but 
		� have no incomplete or pending subtasks.
	theFolder: a folder
	accum: the items lacking next actions that have been found so far 
   � ���   
 	 R e c u r s e s   o v e r   t h e   t r e e   r o o t e d   a t   t h e   g i v e n   f o l d e r ,   a c c u m u l a t e s   a   l i s t   o f   i t e m s   t h a t   a r e : 
 	 	 "   n o t   c o m p l e t e   a n d   
 	 	 "   h a v e   s u b t a s k s ,   b u t   
 	 	 "   h a v e   n o   i n c o m p l e t e   o r   p e n d i n g   s u b t a s k s . 
 	 t h e F o l d e r :   a   f o l d e r 
 	 a c c u m :   t h e   i t e m s   l a c k i n g   n e x t   a c t i o n s   t h a t   h a v e   b e e n   f o u n d   s o   f a r   
� ��� i   3 6��� I      ������� 80 accumulatemissingnasfolder accumulateMissingNAsFolder� ��� o      ���� 0 	thefolder 	theFolder� ���� o      ���� 	0 accum  ��  ��  � w     ��� k    �� ��� Z   ������� l   ������ n    ��� 1    ��
�� 
FCHi� o    ���� 0 	thefolder 	theFolder��  ��  � L   	 �� o   	 
���� 	0 accum  ��  ��  � ��� r    ��� n    ��� 2    ��
�� 
FCSX� o    ���� 0 	thefolder 	theFolder� o      ���� 0 thechildren theChildren� ���� L    �� n   ��� I    ������� ,0 accumulatemissingnas accumulateMissingNAs� ��� o    ���� 0 thechildren theChildren� ���� o    ���� 	0 accum  ��  ��  �  f    ��  ��                                                                                  OFOC   alis    X  Mac Book Pro               �WXfH+     �OmniFocus.app                                                  -P(�p��        ����  	                Applications    �W��      �q       �  'Mac Book Pro:Applications:OmniFocus.app     O m n i F o c u s . a p p    M a c   B o o k   P r o  Applications/OmniFocus.app  / ��  � ��� l     ��������  ��  ��  � ��� l      ������  �
	Uses Growl to display a notification message.
	theTitle � a string giving the notification title
	theDescription � a string describing the notification event
	theNotificationKind � a string giving the notification kind (must be an element of allNotifications)
   � ��� 
 	 U s e s   G r o w l   t o   d i s p l a y   a   n o t i f i c a t i o n   m e s s a g e . 
 	 t h e T i t l e      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   t i t l e 
 	 t h e D e s c r i p t i o n      a   s t r i n g   d e s c r i b i n g   t h e   n o t i f i c a t i o n   e v e n t 
 	 t h e N o t i f i c a t i o n K i n d      a   s t r i n g   g i v i n g   t h e   n o t i f i c a t i o n   k i n d   ( m u s t   b e   a n   e l e m e n t   o f   a l l N o t i f i c a t i o n s ) 
� ���� i   7 :��� I      ������� 
0 notify  � ��� o      ���� 0 thetitle theTitle� ��� o      ����  0 thedescription theDescription� ���� o      ���� *0 thenotificationkind theNotificationKind��  ��  � O     4��� k    3�� ��� I   !�����
�� .registernull��� ��� null��  � �� 
�� 
appl  o    ���� 0 growlappname growlAppName ��
�� 
anot o    ���� $0 allnotifications allNotifications ��
�� 
dnot o    ���� ,0 defaultnotifications defaultNotifications ����
�� 
iapp o    ���� 00 iconloaningapplication iconLoaningApplication��  � �� I  " 3����
�� .notifygrnull��� ��� null��   ��	

�� 
name	 o   $ %���� *0 thenotificationkind theNotificationKind
 ��
�� 
titl o   & '���� 0 thetitle theTitle ��
�� 
appl o   ( -���� 0 growlappname growlAppName ����
�� 
desc o   . /����  0 thedescription theDescription��  ��  � m     2                                                                                  GRRR   alis    �  Mac Book Pro               �WXfH+   8 �GrowlHelperApp.app                                              8 ��n̥        ����  	                	Resources     �W��      �o�     8 � 8 � 8 �  �     YMac Book Pro:Library:PreferencePanes:Growl.prefPane:Contents:Resources:GrowlHelperApp.app   &  G r o w l H e l p e r A p p . a p p    M a c   B o o k   P r o  LLibrary/PreferencePanes/Growl.prefPane/Contents/Resources/GrowlHelperApp.app  / ��  ��       ��   ( - 2 C��   ���������������������������������� *0 lackinglistingdelim lackingListingDelim�� "0 missingnasuffix missingNASuffix�� (0 missingnadelimiter missingNADelimiter�� 0 growlappname growlAppName�� 20 scriptstartnotification scriptStartNotification�� 40 scriptfinishnotification scriptFinishNotification�� ,0 defaultnotifications defaultNotifications�� $0 allnotifications allNotifications�� 00 iconloaningapplication iconLoaningApplication�� ,0 accumulatemissingnas accumulateMissingNAs�� 80 accumulatemissingnashelper accumulateMissingNAsHelper�� :0 accumulatemissingnasproject accumulateMissingNAsProject�� 40 accumulatemissingnastask accumulateMissingNAsTask�� 80 accumulatemissingnasfolder accumulateMissingNAsFolder�� 
0 notify  
�� .aevtoappnull  �   � **** �           "   ����    2 ����    2 - �� ����� ���� ,0 accumulatemissingnas accumulateMissingNAs�� ��!�� !  ������ 0 thesections theSections�� 	0 accum  ��   ������ 0 thesections theSections�� 	0 accum    ��������
�� 
rest
�� 
cobj�� 80 accumulatemissingnashelper accumulateMissingNAsHelper�� ,0 accumulatemissingnas accumulateMissingNAs�� "�jv  �Y hO*��,*��k/�l+ l+  ������"#���� 80 accumulatemissingnashelper accumulateMissingNAsHelper�� ��$�� $  ������ 0 theitem theItem�� 	0 accum  ��  " ������ 0 theitem theItem�� 	0 accum  # ������������
�� 
pcls
�� 
FCpr�� :0 accumulatemissingnasproject accumulateMissingNAsProject
�� 
FCAr�� 80 accumulatemissingnasfolder accumulateMissingNAsFolder�� 40 accumulatemissingnastask accumulateMissingNAsTask�� 2�Z��,�  )��l+ Y ��,�  )��l+ Y )�f�m+  ��>����%&���� :0 accumulatemissingnasproject accumulateMissingNAsProject�� ��'�� '  ������ 0 
theproject 
theProject�� 	0 accum  ��  % �������� 0 
theproject 
theProject�� 	0 accum  �� 0 theroottask theRootTask& D������������
�� 
FCPs
�� FCPsFCPa
�� 
FC.A
�� 
bool
�� 
FCrt�� 40 accumulatemissingnastask accumulateMissingNAsTask�� 0�Z� *�,�
 	*�,e �& �Y hUO��,E�O)�e�m+  ��n����()���� 40 accumulatemissingnastask accumulateMissingNAsTask�� ��*�� *  ��~�}� 0 thetask theTask�~ 0 isprojectroot isProjectRoot�} 	0 accum  ��  ( �|�{�z�y�x�| 0 thetask theTask�{ 0 isprojectroot isProjectRoot�z 	0 accum  �y 80 isaprojectorsubprojecttask isAProjectOrSubprojectTask�x ,0 incompletechildtasks incompleteChildTasks) v�w�v�u�t+�s�r
�w 
FCac
�v .corecnte****       ****
�u 
bool
�t 
FCcd+  
�s 
pnam�r ,0 accumulatemissingnas accumulateMissingNAs�� ��Z� {�
 *�-j j�&E�O*�,E
 ��& �Y hO*�-�[�,\Zf81E�O�j j  3*�,�6FO*�,b   *�,b  %b  %*�,FY hO�Y 
)��l+ U �q��p�o,-�n�q 80 accumulatemissingnasfolder accumulateMissingNAsFolder�p �m.�m .  �l�k�l 0 	thefolder 	theFolder�k 	0 accum  �o  , �j�i�h�j 0 	thefolder 	theFolder�i 	0 accum  �h 0 thechildren theChildren- ��g�f�e
�g 
FCHi
�f 
FCSX�e ,0 accumulatemissingnas accumulateMissingNAs�n �Z��,E �Y hO��-E�O)��l+  �d��c�b/0�a�d 
0 notify  �c �`1�` 1  �_�^�]�_ 0 thetitle theTitle�^  0 thedescription theDescription�] *0 thenotificationkind theNotificationKind�b  / �\�[�Z�\ 0 thetitle theTitle�[  0 thedescription theDescription�Z *0 thenotificationkind theNotificationKind0 �Y�X�W�V�U�T�S�R�Q�P
�Y 
appl
�X 
anot
�W 
dnot
�V 
iapp�U 
�T .registernull��� ��� null
�S 
name
�R 
titl
�Q 
desc
�P .notifygrnull��� ��� null�a 5� 1*�b  �b  �b  �b  � O*���b  �� 
U �O2�N�M34�L
�O .aevtoappnull  �   � ****2 k     �55  G66  V�K�K  �N  �M  3  4  O S�J ��I�H�G�F�E x |�D�C � ��B�A�@�?�>�= � ��<�; � ��: ��9�8�J 
0 notify  
�I 
docu
�H 
FCSX�G 0 thesections theSections�F ,0 accumulatemissingnas accumulateMissingNAs�E (0 lackingnextactions lackingNextActions
�D .corecnte****       ****�C 
�B 0 msg  
�A 
ascr
�@ 
txdl�? 0 olddelim oldDelim
�> 
ctxt�=  0 lackinglisting lackingListing
�< 
mesS
�; 
ret 
�: 
btns�9 
�8 .sysodisAaleR        TEXT�L �)��b  m+ O� �*�k/ �*�-E�O)�jvl+ E�O�jv  )��b  m+ Y ��j � ��j %�%E�Y A_ a ,E` Ob   _ a ,FO�a &E` O_ _ a ,FOa b   %_ %E�Oa a �_ %a %b  %a %a a kva  UUascr  ��ޭ