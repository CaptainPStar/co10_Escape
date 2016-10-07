#define VERSION "{* VERSION *}"
#define MISSIONNAME "{* MISSION *} {* ISLANDNAME *} {* MOD *}"
#define MISSIONNAMEFULL "{* MISSION_FULL *} {* ISLANDNAME *} {* MOD *} {* VERSION *}"

#define CT_STATIC	0
#define CT_BUTTON	1
#define CT_EDIT	2
#define CT_SLIDER	3
#define CT_COMBO	4
#define CT_LISTBOX	5
#define CT_TOOLBOX	6
#define CT_CHECKBOXES	7
#define CT_PROGRESS	8
#define CT_HTML	9
#define CT_STATIC_SKEW	10
#define CT_ACTIVETEXT	11
#define CT_TREE	12
#define CT_STRUCTURED_TEXT	13
#define CT_CONTEXT_MENU	14
#define CT_CONTROLS_GROUP	15
#define CT_XKEYDESC	40
#define CT_XBUTTON	41
#define CT_XLISTBOX	42
#define CT_XSLIDER	43
#define CT_XCOMBO	44
#define CT_ANIMATED_TEXTURE	45
#define CT_OBJECT	80
#define CT_OBJECT_ZOOM	81
#define CT_OBJECT_CONTAINER	82
#define CT_OBJECT_CONT_ANIM	83
#define CT_LINEBREAK	98
#define CT_USER	99
#define CT_MAP	100
#define CT_MAP_MAIN	101
#define ST_POS	0x0F
#define ST_HPOS	0x03
#define ST_VPOS	0x0C
#define ST_LEFT	0x00
#define ST_RIGHT	0x01
#define ST_CENTER	0x02
#define ST_DOWN	0x04
#define ST_UP	0x08
#define ST_VCENTER	0x0c
#define ST_TYPE	0xF0
#define ST_SINGLE	0
#define ST_MULTI	16
#define ST_TITLE_BAR	32
#define ST_PICTURE	48
#define ST_FRAME	64
#define ST_BACKGROUND	80
#define ST_GROUP_BOX	96
#define ST_GROUP_BOX2	112
#define ST_HUD_BACKGROUND	128
#define ST_TILE_PICTURE	144
#define ST_WITH_RECT	160
#define ST_LINE	176
#define ST_SHADOW	0x100
#define ST_NO_RECT	0x200
#define ST_KEEP_ASPECT_RATIO	0x800
#define ST_TITLE	ST_TITLE_BAR + ST_CENTER
#define SL_DIR	0x400
#define SL_VERT	0
#define SL_HORZ	0x400
#define SL_TEXTURES	0x10
#define LB_TEXTURES	0x10
#define LB_MULTI	0x20
#define FontM	"TahomaB"
#define FontHTML	"TahomaB"


class RscText
{
	type=CT_STATIC;
	idc=-1;
	style=ST_LEFT;
	colorBackground[]={0, 0, 0, 0};
	colorText[]={1, 1, 1, 1};
	font=FontM;
	sizeEx=0.02;
	text="";
};

class RscBgFrame
{
	type=CT_STATIC;
	idc=-1;
	style=ST_FRAME;
	colorBackground[]={0.4, 0.4, 0.4, 0.75};
	colorText[]={0, 0, 0, 1};
	font=FontM;
	SizeEX=0.025;
	text="";
};

class RscBackground
{
	colorBackground[]={0.4, 0.4, 0.4, 0.75};
	text="";
	type=CT_STATIC;
	idc=-1;
	style=ST_LEFT;
	colorText[]={1, 1, 1, 1};
	font=FontM;
	sizeEx=0.04;
};

class RscPicture
{
	type=CT_STATIC;
	idc=-1;
	style=ST_PICTURE;
	colorBackground[]={0, 0, 0, 0};
	colorText[]={1, 1, 1, 1};
	font=FontM;
	sizeEx=0.02;
	text="";
};

class RscButton
{
	type=CT_BUTTON;
	idc=-1;
	style=ST_CENTER;
	colorText[]={0, 0, 0, 1};
	font=FontHTML;
	sizeEx=0.025;
	soundPush[]={"", 0.2, 1};
	soundClick[]={"ui\ui_ok", 0.2, 1};
	soundEscape[]={"ui\ui_cc", 0.2, 1};
	default=false;
	text="";
	action="";
	colorActive[]={0, 0, 0, 0};
	colorDisabled[]={0, 0, 0, 0.1};
	colorBackground[]={0,0,0,0.3};
	colorBackgroundActive[]={0,0,0,0.4};
	colorBackgroundDisabled[]={0,0,0,0.3};
	colorFocused[]={0.84,1,0.55,1};
	colorShadow[]={1, 1, 1, 0.1};
	colorBorder[]={0, 0, 0, 0.1};
	offsetX=0;
	offsetY=0;
	offsetPressedX=0;
	offsetPressedY=0;
	borderSize=0;
	soundEnter[]={"", 0.15, 1};
};

class RscButton2:RscButton
{
	x=-1.0;
	y=-1.0;
	idc=-1;
	w=0.01;
	h=0.01;
	default=true;
};

class RscEdit
{
	type=CT_EDIT;
	idc=-1;
	style=ST_LEFT;
	font=FontHTML;
	sizeEx=0.02;
	colorText[]={0, 0, 0, 1};
	colorSelection[]={0.5, 0.5, 0.5, 1};
	autocomplete=false;
	text="";
};

class RscListBox
		{
			access = 0; // Control access (0 - ReadAndWrite, 1 - ReadAndCreate, 2 - ReadOnly, 3 - ReadOnlyVerified)
			idc = CT_LISTBOX; // Control identification (without it, the control won't be displayed)
			type = CT_LISTBOX; // Type is 5
			style = ST_LEFT + LB_TEXTURES; // Style
			default = 0; // Control selected by default (only one within a display can be used)
			blinkingPeriod = 0; // Time in which control will fade out and back in. Use 0 to disable the effect.


			colorBackground[] = {0.2,0.2,0.2,1}; // Fill color
			colorSelectBackground[] = {1,0.5,0,1}; // Selected item fill color
			colorSelectBackground2[] = {0,0,0,1}; // Selected item fill color (oscillates between this and colorSelectBackground)

			sizeEx = 0.025; // Text size
			font = GUI_FONT_NORMAL; // Font from CfgFontFamilies
			shadow = 0; // Shadow (0 - none, 1 - directional, color affected by colorShadow, 2 - black outline)
			colorText[] = {1,1,1,1}; // Text and frame color
			colorDisabled[] = {1,1,1,0.5}; // Disabled text color
			colorSelect[] = {1,1,1,1}; // Text selection color
			colorSelect2[] = {1,1,1,1}; // Text selection color (oscillates between this and colorSelect)
			colorShadow[] = {0,0,0,0.5}; // Text shadow color (used only when shadow is 1)

			pictureColor[] = {1,0.5,0,1}; // Picture color
			pictureColorSelect[] = {1,1,1,1}; // Selected picture color
			pictureColorDisabled[] = {1,1,1,0.5}; // Disabled picture color

			tooltip = "CT_LISTBOX"; // Tooltip text
			tooltipColorShade[] = {0,0,0,1}; // Tooltip background color
			tooltipColorText[] = {1,1,1,1}; // Tooltip text color
			tooltipColorBox[] = {1,1,1,1}; // Tooltip frame color

			period = 1; // Oscillation time between colorSelect/colorSelectBackground2 and colorSelect2/colorSelectBackground when selected

			rowHeight = 0.04; // Row height
			itemSpacing = 0; // Height of empty space between items
			maxHistoryDelay = 1; // Time since last keyboard type search to reset it
			canDrag = 1; // 1 (true) to allow item dragging

			soundSelect[] = {"\A3\ui_f\data\sound\RscListbox\soundSelect",0.09,1}; // Sound played when an item is selected

			// Scrollbar configuration (applied only when LB_TEXTURES style is used)
			class ListScrollBar //In older games this class is "ScrollBar"
			{
				width = 0; // width of ListScrollBar
				height = 0; // height of ListScrollBar
				scrollSpeed = 0.01; // scroll speed of ListScrollBar

				arrowEmpty = "\A3\ui_f\data\gui\cfg\scrollbar\arrowEmpty_ca.paa"; // Arrow
				arrowFull = "\A3\ui_f\data\gui\cfg\scrollbar\arrowFull_ca.paa"; // Arrow when clicked on
				border = "\A3\ui_f\data\gui\cfg\scrollbar\border_ca.paa"; // Slider background (stretched vertically)
				thumb = "\A3\ui_f\data\gui\cfg\scrollbar\thumb_ca.paa"; // Dragging element (stretched vertically)

				color[] = {1,1,1,1}; // Scrollbar color
			};

			onCanDestroy = "systemChat str ['onCanDestroy',_this]; true";
			onDestroy = "systemChat str ['onDestroy',_this]; false";
			onSetFocus = "systemChat str ['onSetFocus',_this]; false";
			onKillFocus = "systemChat str ['onKillFocus',_this]; false";
			onKeyDown = "systemChat str ['onKeyDown',_this]; false";
			onKeyUp = "systemChat str ['onKeyUp',_this]; false";
			onMouseButtonDown = "systemChat str ['onMouseButtonDown',_this]; false";
			onMouseButtonUp = "systemChat str ['onMouseButtonUp',_this]; false";
			onMouseButtonClick = "systemChat str ['onMouseButtonClick',_this]; false";
			onMouseButtonDblClick = "systemChat str ['onMouseButtonDblClick',_this]; false";
			onMouseZChanged = "systemChat str ['onMouseZChanged',_this]; false";
			onMouseMoving = "";
			onMouseHolding = "";

			onLBSelChanged = "systemChat str ['onLBSelChanged',_this]; false";
			onLBDblClick = "systemChat str ['onLBDblClick',_this]; false";
			onLBDrag = "systemChat str ['onLBDrag',_this]; false";
			onLBDragging = "systemChat str ['onLBDragging',_this]; false";
			onLBDrop = "systemChat str ['onLBDrop',_this]; false";
		};