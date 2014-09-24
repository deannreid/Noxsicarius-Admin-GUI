
class noxAT
{
	name=noxAT;
	idd=-1;
	movingEnable=0;
	controlsBackground[]={noxBG};
	objects[]={};
	controls[]={plrSurviveCount, plrHumanCount, plrNameCnt, plrSurvived, plrName, plrHuman, noxPlrStatsTitle, noxPlrStats, noxPlrTitle, noxTitle, noxPlrFrame, noxBGFrame};

	
	//Outline/Background
	class noxBG:RscBackground
	{
		idc=-1;
		x=0.1;
		y=0.0888888888888889;
		w=0.8;
		h=0.82962962962963;
	};
	class noxBGFrame:RscBgFrame
	{
		idc=-1;
		x=0.1;
		y=0.0888888888888889;
		w=0.8;
		h=0.82962962962963;
	};
	class noxPlrFrame:RscBgFrame
	{
		idc=-1;
		x=0.766666666666667;
		y=0.0888888888888889;
		w=0.133333333333333;
		h=0.82962962962963;
	};
	class noxPlrStats:RscBgFrame
	{
		idc=-1;
		x=0.1;
		y=0.740740740740741;
		w=0.666666666666667;
		h=0.177777777777778;
	};
	//Titles
	class noxPlrTitle:RscText
	{
		idc=-1;
		x=0.766666666666667;
		y=0.0888888888888889;
		w=0.133333333333333;
		h=0.0296296296296296;
	};
	class noxTitle:RscText
	{
		idc=-1;
		x=0.1;
		y=0.0888888888888889;
		w=0.683333333333333;
		h=0.0296296296296296;
	};
	class noxPlrStatsTitle:RscText
	{
		idc=-1;
		x=0.1;
		y=0.740740740740741;
		w=0.666666666666667;
		h=0.0296296296296296;
	};
	//Stats
	//Player Name
	class plrName:RscText
	{
		idc=-1;
		x=0.1;
		y=0.785185185185185;
		w=0.0666666666666667;
		h=0.0296296296296296;
	};
	
	class plrNameCnt:RscText
	{
		idc=-1;
		x=0.175;
		y=0.785185185185185;
		w=0.0916666666666667;
		h=0.0296296296296296;
	};

	//Dayz Survived
	class plrSurvived:RscText
	{
		idc=-1;
		x=0.1;
		y=0.874074074074074;
		w=0.0666666666666667;
		h=0.0296296296296296;
	};	
	
	class plrSurviveCount:RscText
	{
		idc=-1;
		x=0.175;
		y=0.874074074074074;
		w=0.0916666666666667;
		h=0.0296296296296296;
	};

	//Humanity
	class plrHuman:RscText
	{
		idc=-1;
		x=0.1;
		y=0.82962962962963;
		w=0.0666666666666667;
		h=0.0296296296296296;
	};	
	class plrHumanCount:RscText
	{
		idc=-1;
		x=0.175;
		y=0.82962962962963;
		w=0.0916666666666667;
		h=0.0296296296296296;
	};
};