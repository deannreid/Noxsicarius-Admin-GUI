class noxAT
{
	name=noxAT;
	idd=-1;
	movingEnable=0;
	controlsBackground[]={noxBG};
	objects[]={};
	controls[]={noxPlrTitle, noxTitle, noxPlrFrame, noxBGFrame};

	class noxPlrTitle:RscText
	{
		idc=-1;
		title="Player List";
		x=0.766666666666667;
		y=0.0888888888888889;
		w=0.133333333333333;
		h=0.0296296296296296;
	};

	class noxTitle:RscText
	{
		idc=-1;
		text="Admin Tools V2 by NoxSicarius";
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