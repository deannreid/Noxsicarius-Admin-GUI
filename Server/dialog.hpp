class noxAT
{
	name=noxAT;
	idd=-1;
	movingEnable=0;
	controlsBackground[]={noxBG};
	objects[]={};
	controls[]={plrSurvived, plrName, plrHuman, rscPlrStatsTitle, rscPlrStats, noxPlrTitle, noxTitle, noxPlrFrame, noxBGFrame};

	class plrSurvived:RscText
	{
		idc=-1;
		x=0.1;
		y=0.874074074074074;
		w=0.0666666666666667;
		h=0.0296296296296296;
	};

	class plrName:RscText
	{
		idc=-1;
		x=0.1;
		y=0.785185185185185;
		w=0.0666666666666667;
		h=0.0296296296296296;
	};

	class plrHuman:RscText
	{
		idc=-1;
		x=0.1;
		y=0.82962962962963;
		w=0.0666666666666667;
		h=0.0296296296296296;
	};

	class rscPlrStatsTitle:RscText
	{
		idc=-1;
		x=0.1;
		y=0.740740740740741;
		w=0.666666666666667;
		h=0.0296296296296296;
	};

	class rscPlrStats:RscBgFrame
	{
		idc=-1;
		x=0.1;
		y=0.740740740740741;
		w=0.666666666666667;
		h=0.177777777777778;
	};

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

	class noxPlrFrame:RscBgFrame
	{
		idc=-1;
		x=0.766666666666667;
		y=0.0888888888888889;
		w=0.133333333333333;
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

	class noxBG:RscBackground
	{
		idc=-1;
		x=0.1;
		y=0.0888888888888889;
		w=0.8;
		h=0.82962962962963;
	};
};