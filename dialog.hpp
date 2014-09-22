class adminDialog
{
	name=adminDialog;
	idd=-1;
	movingEnable=0;
	controlsBackground[]={rscAdminPList, rscAdminTitle, rscAdminBG, rscAdminBGF};
	objects[]={};
	controls[]={rscAdminPLT};

	class rscAdminPLT:RscText
	{
		idc=-1;
		title="Player List";
		x=0.15;
		y=0.0888888888888889;
		w=0.2;
		h=0.0296296296296296;
	};

	class rscAdminPList:RscBgFrame
	{
		idc=-1;
		x=0.15;
		y=0.0888888888888889;
		w=0.2;
		h=0.82962962962963;
	};

	class rscAdminTitle:RscText
	{
		idc=-1;
		text="Admin Tools V2 by NoxSicarius";
		x=0.383333333333333;
		y=0.0888888888888889;
		w=0.233333333333333;
		h=0.0296296296296296;
	};

	class rscAdminBG:RscBackground
	{
		idc=-1;
		x=0.15;
		y=0.0888888888888889;
		w=0.733333333333333;
		h=0.82962962962963;
	};

	class rscAdminBGF:RscBgFrame
	{
		idc=-1;
		x=0.15;
		y=0.0888888888888889;
		w=0.733333333333333;
		h=0.82962962962963;
	};
};