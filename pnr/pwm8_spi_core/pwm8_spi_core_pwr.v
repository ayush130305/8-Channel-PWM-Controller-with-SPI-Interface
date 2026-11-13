module pwm8_spi_core (clk,
    cs_n,
    miso_pn,
    mosi,
    rst_n,
    sclk,
    sync_pn,
    pwm_pn);
 input clk;
 input cs_n;
 output miso_pn;
 input mosi;
 input rst_n;
 input sclk;
 output sync_pn;
 output [7:0] pwm_pn;

 wire _0000_;
 wire _0001_;
 wire _0002_;
 wire _0003_;
 wire _0004_;
 wire _0005_;
 wire _0006_;
 wire _0007_;
 wire _0008_;
 wire _0009_;
 wire _0010_;
 wire _0011_;
 wire _0012_;
 wire _0013_;
 wire _0014_;
 wire _0015_;
 wire _0016_;
 wire _0017_;
 wire _0018_;
 wire _0019_;
 wire _0020_;
 wire _0021_;
 wire _0022_;
 wire _0023_;
 wire _0024_;
 wire _0025_;
 wire _0026_;
 wire _0027_;
 wire _0028_;
 wire _0029_;
 wire _0030_;
 wire _0031_;
 wire _0032_;
 wire _0033_;
 wire _0034_;
 wire _0035_;
 wire _0036_;
 wire _0037_;
 wire _0038_;
 wire _0039_;
 wire _0040_;
 wire _0041_;
 wire _0042_;
 wire _0043_;
 wire _0044_;
 wire _0045_;
 wire _0046_;
 wire _0047_;
 wire _0048_;
 wire _0049_;
 wire _0050_;
 wire _0051_;
 wire _0052_;
 wire _0053_;
 wire _0054_;
 wire _0055_;
 wire _0056_;
 wire _0057_;
 wire _0058_;
 wire _0059_;
 wire _0060_;
 wire _0061_;
 wire _0062_;
 wire _0063_;
 wire _0064_;
 wire _0065_;
 wire _0066_;
 wire _0067_;
 wire _0068_;
 wire _0069_;
 wire _0070_;
 wire _0071_;
 wire _0072_;
 wire _0073_;
 wire _0074_;
 wire _0075_;
 wire _0076_;
 wire _0077_;
 wire _0078_;
 wire _0079_;
 wire _0080_;
 wire _0081_;
 wire _0082_;
 wire _0083_;
 wire _0084_;
 wire _0085_;
 wire _0086_;
 wire _0087_;
 wire _0088_;
 wire _0089_;
 wire _0090_;
 wire _0091_;
 wire _0092_;
 wire _0093_;
 wire _0094_;
 wire _0095_;
 wire _0096_;
 wire _0097_;
 wire _0098_;
 wire _0099_;
 wire _0100_;
 wire _0101_;
 wire _0102_;
 wire _0103_;
 wire _0104_;
 wire _0105_;
 wire _0106_;
 wire _0107_;
 wire _0108_;
 wire _0109_;
 wire _0110_;
 wire _0111_;
 wire _0112_;
 wire _0113_;
 wire _0114_;
 wire _0115_;
 wire _0116_;
 wire _0117_;
 wire _0118_;
 wire _0119_;
 wire _0120_;
 wire _0121_;
 wire _0122_;
 wire _0123_;
 wire _0124_;
 wire _0125_;
 wire _0126_;
 wire _0127_;
 wire _0128_;
 wire _0129_;
 wire _0130_;
 wire _0131_;
 wire _0132_;
 wire _0133_;
 wire _0134_;
 wire _0135_;
 wire _0136_;
 wire _0137_;
 wire _0138_;
 wire _0139_;
 wire _0140_;
 wire _0141_;
 wire _0142_;
 wire _0143_;
 wire _0144_;
 wire _0145_;
 wire _0146_;
 wire _0147_;
 wire _0148_;
 wire _0149_;
 wire _0150_;
 wire _0151_;
 wire _0152_;
 wire _0153_;
 wire _0154_;
 wire _0155_;
 wire _0156_;
 wire _0157_;
 wire _0158_;
 wire _0159_;
 wire _0160_;
 wire _0161_;
 wire _0162_;
 wire _0163_;
 wire _0164_;
 wire _0165_;
 wire _0166_;
 wire _0167_;
 wire _0168_;
 wire _0169_;
 wire _0170_;
 wire _0171_;
 wire _0172_;
 wire _0173_;
 wire _0174_;
 wire _0175_;
 wire _0176_;
 wire _0177_;
 wire _0178_;
 wire _0179_;
 wire _0180_;
 wire _0181_;
 wire _0182_;
 wire _0183_;
 wire _0184_;
 wire _0185_;
 wire _0186_;
 wire _0187_;
 wire _0188_;
 wire _0189_;
 wire _0190_;
 wire _0191_;
 wire _0192_;
 wire _0193_;
 wire _0194_;
 wire _0195_;
 wire _0196_;
 wire _0197_;
 wire _0198_;
 wire _0199_;
 wire _0200_;
 wire _0201_;
 wire _0202_;
 wire _0203_;
 wire _0204_;
 wire _0205_;
 wire _0206_;
 wire _0207_;
 wire _0208_;
 wire _0209_;
 wire _0210_;
 wire _0211_;
 wire _0212_;
 wire _0213_;
 wire _0214_;
 wire _0215_;
 wire _0216_;
 wire _0217_;
 wire _0218_;
 wire _0219_;
 wire _0220_;
 wire _0221_;
 wire _0222_;
 wire _0223_;
 wire _0224_;
 wire _0225_;
 wire _0226_;
 wire _0227_;
 wire _0228_;
 wire _0229_;
 wire _0230_;
 wire _0231_;
 wire _0232_;
 wire _0233_;
 wire _0234_;
 wire _0235_;
 wire _0236_;
 wire _0237_;
 wire _0238_;
 wire _0239_;
 wire _0240_;
 wire _0241_;
 wire _0242_;
 wire _0243_;
 wire _0244_;
 wire _0245_;
 wire _0246_;
 wire _0247_;
 wire _0248_;
 wire _0249_;
 wire _0250_;
 wire _0251_;
 wire _0252_;
 wire _0253_;
 wire _0254_;
 wire _0255_;
 wire _0256_;
 wire _0257_;
 wire _0258_;
 wire _0259_;
 wire _0260_;
 wire _0261_;
 wire _0262_;
 wire _0263_;
 wire _0264_;
 wire _0265_;
 wire _0266_;
 wire _0267_;
 wire _0268_;
 wire _0269_;
 wire _0270_;
 wire _0271_;
 wire _0272_;
 wire _0273_;
 wire _0274_;
 wire _0275_;
 wire _0276_;
 wire _0277_;
 wire _0278_;
 wire _0279_;
 wire _0280_;
 wire _0281_;
 wire _0282_;
 wire _0283_;
 wire _0284_;
 wire _0285_;
 wire _0286_;
 wire _0287_;
 wire _0288_;
 wire _0289_;
 wire _0290_;
 wire _0291_;
 wire _0292_;
 wire _0293_;
 wire _0294_;
 wire _0295_;
 wire _0296_;
 wire _0297_;
 wire _0298_;
 wire _0299_;
 wire _0300_;
 wire _0301_;
 wire _0302_;
 wire _0303_;
 wire _0304_;
 wire _0305_;
 wire _0306_;
 wire _0307_;
 wire _0308_;
 wire _0309_;
 wire _0310_;
 wire _0311_;
 wire _0312_;
 wire _0313_;
 wire _0314_;
 wire _0315_;
 wire _0316_;
 wire _0317_;
 wire _0318_;
 wire _0319_;
 wire _0320_;
 wire _0321_;
 wire _0322_;
 wire _0323_;
 wire _0324_;
 wire _0325_;
 wire _0326_;
 wire _0327_;
 wire _0328_;
 wire _0329_;
 wire _0330_;
 wire _0331_;
 wire _0332_;
 wire _0333_;
 wire _0334_;
 wire _0335_;
 wire _0336_;
 wire _0337_;
 wire _0338_;
 wire _0339_;
 wire _0340_;
 wire _0341_;
 wire _0342_;
 wire _0343_;
 wire _0344_;
 wire _0345_;
 wire _0346_;
 wire _0347_;
 wire _0348_;
 wire _0349_;
 wire _0350_;
 wire _0351_;
 wire _0352_;
 wire _0353_;
 wire _0354_;
 wire _0355_;
 wire _0356_;
 wire _0357_;
 wire _0358_;
 wire _0359_;
 wire _0360_;
 wire _0361_;
 wire _0362_;
 wire _0363_;
 wire _0364_;
 wire _0365_;
 wire _0366_;
 wire _0367_;
 wire _0368_;
 wire _0369_;
 wire _0370_;
 wire _0371_;
 wire _0372_;
 wire _0373_;
 wire _0374_;
 wire _0375_;
 wire _0376_;
 wire _0377_;
 wire _0378_;
 wire _0379_;
 wire _0380_;
 wire _0381_;
 wire _0382_;
 wire _0383_;
 wire _0384_;
 wire _0385_;
 wire _0386_;
 wire _0387_;
 wire _0388_;
 wire _0389_;
 wire _0390_;
 wire _0391_;
 wire _0392_;
 wire _0393_;
 wire _0394_;
 wire _0395_;
 wire _0396_;
 wire _0397_;
 wire _0398_;
 wire _0399_;
 wire _0400_;
 wire _0401_;
 wire _0402_;
 wire _0403_;
 wire _0404_;
 wire _0405_;
 wire _0406_;
 wire _0407_;
 wire _0408_;
 wire _0409_;
 wire _0410_;
 wire _0411_;
 wire _0412_;
 wire _0413_;
 wire _0414_;
 wire _0415_;
 wire _0416_;
 wire _0417_;
 wire _0418_;
 wire _0419_;
 wire _0420_;
 wire _0421_;
 wire _0422_;
 wire _0423_;
 wire _0424_;
 wire _0425_;
 wire _0426_;
 wire _0427_;
 wire _0428_;
 wire _0429_;
 wire _0430_;
 wire _0431_;
 wire _0432_;
 wire _0433_;
 wire _0434_;
 wire _0435_;
 wire _0436_;
 wire _0437_;
 wire _0438_;
 wire _0439_;
 wire _0440_;
 wire _0441_;
 wire _0442_;
 wire _0443_;
 wire _0444_;
 wire _0445_;
 wire _0446_;
 wire _0447_;
 wire _0448_;
 wire _0449_;
 wire _0450_;
 wire _0451_;
 wire _0452_;
 wire _0453_;
 wire _0454_;
 wire _0455_;
 wire _0456_;
 wire _0457_;
 wire _0458_;
 wire _0459_;
 wire _0460_;
 wire _0461_;
 wire _0462_;
 wire _0463_;
 wire _0464_;
 wire _0465_;
 wire _0466_;
 wire _0467_;
 wire _0468_;
 wire _0469_;
 wire _0470_;
 wire _0471_;
 wire _0472_;
 wire _0473_;
 wire _0474_;
 wire _0475_;
 wire _0476_;
 wire _0477_;
 wire _0478_;
 wire _0479_;
 wire _0480_;
 wire _0481_;
 wire _0482_;
 wire _0483_;
 wire _0484_;
 wire _0485_;
 wire _0486_;
 wire _0487_;
 wire _0488_;
 wire _0489_;
 wire _0490_;
 wire _0491_;
 wire _0492_;
 wire _0493_;
 wire _0494_;
 wire _0495_;
 wire _0496_;
 wire _0497_;
 wire _0498_;
 wire _0499_;
 wire _0500_;
 wire _0501_;
 wire _0502_;
 wire _0503_;
 wire _0504_;
 wire _0505_;
 wire _0506_;
 wire _0507_;
 wire _0508_;
 wire _0509_;
 wire _0510_;
 wire _0511_;
 wire _0512_;
 wire _0513_;
 wire _0514_;
 wire _0515_;
 wire _0516_;
 wire _0517_;
 wire _0518_;
 wire _0519_;
 wire _0520_;
 wire _0521_;
 wire _0522_;
 wire _0523_;
 wire _0524_;
 wire _0525_;
 wire _0526_;
 wire _0527_;
 wire _0528_;
 wire _0529_;
 wire _0530_;
 wire _0531_;
 wire _0532_;
 wire _0533_;
 wire _0534_;
 wire _0535_;
 wire _0536_;
 wire _0537_;
 wire _0538_;
 wire _0539_;
 wire _0540_;
 wire _0541_;
 wire _0542_;
 wire _0543_;
 wire _0544_;
 wire _0545_;
 wire _0546_;
 wire _0547_;
 wire _0548_;
 wire _0549_;
 wire _0550_;
 wire _0551_;
 wire _0552_;
 wire _0553_;
 wire _0554_;
 wire _0555_;
 wire _0556_;
 wire _0557_;
 wire _0558_;
 wire _0559_;
 wire _0560_;
 wire _0561_;
 wire _0562_;
 wire _0563_;
 wire _0564_;
 wire _0565_;
 wire _0566_;
 wire _0567_;
 wire _0568_;
 wire _0569_;
 wire _0570_;
 wire _0571_;
 wire _0572_;
 wire _0573_;
 wire _0574_;
 wire _0575_;
 wire _0576_;
 wire _0577_;
 wire _0578_;
 wire _0579_;
 wire _0580_;
 wire _0581_;
 wire _0582_;
 wire _0583_;
 wire _0584_;
 wire _0585_;
 wire _0586_;
 wire _0587_;
 wire _0588_;
 wire _0589_;
 wire _0590_;
 wire _0591_;
 wire _0592_;
 wire _0593_;
 wire _0594_;
 wire _0595_;
 wire _0596_;
 wire _0597_;
 wire _0598_;
 wire _0599_;
 wire _0600_;
 wire _0601_;
 wire _0602_;
 wire _0603_;
 wire _0604_;
 wire _0605_;
 wire _0606_;
 wire _0607_;
 wire _0608_;
 wire _0609_;
 wire _0610_;
 wire _0611_;
 wire _0612_;
 wire _0613_;
 wire _0614_;
 wire _0615_;
 wire _0616_;
 wire _0617_;
 wire _0618_;
 wire _0619_;
 wire _0620_;
 wire _0621_;
 wire _0622_;
 wire _0623_;
 wire _0624_;
 wire _0625_;
 wire _0626_;
 wire _0627_;
 wire _0630_;
 wire _0631_;
 wire _0632_;
 wire _0633_;
 wire _0634_;
 wire _0635_;
 wire _0636_;
 wire _0637_;
 wire _0638_;
 wire _0639_;
 wire _0640_;
 wire _0641_;
 wire _0642_;
 wire _0643_;
 wire _0644_;
 wire _0645_;
 wire _0646_;
 wire _0647_;
 wire _0648_;
 wire _0649_;
 wire _0650_;
 wire _0651_;
 wire _0652_;
 wire _0653_;
 wire _0654_;
 wire _0655_;
 wire _0656_;
 wire _0657_;
 wire _0658_;
 wire _0659_;
 wire _0660_;
 wire _0661_;
 wire _0662_;
 wire _0663_;
 wire _0664_;
 wire _0665_;
 wire _0666_;
 wire _0667_;
 wire _0668_;
 wire _0669_;
 wire _0670_;
 wire _0671_;
 wire _0672_;
 wire _0673_;
 wire _0674_;
 wire _0675_;
 wire _0676_;
 wire _0677_;
 wire _0678_;
 wire _0679_;
 wire _0680_;
 wire _0681_;
 wire _0682_;
 wire _0683_;
 wire _0684_;
 wire _0685_;
 wire _0686_;
 wire _0687_;
 wire _0688_;
 wire _0689_;
 wire _0690_;
 wire _0691_;
 wire _0692_;
 wire _0693_;
 wire _0694_;
 wire _0695_;
 wire _0696_;
 wire _0697_;
 wire _0698_;
 wire _0699_;
 wire _0700_;
 wire _0701_;
 wire _0702_;
 wire _0703_;
 wire _0704_;
 wire _0705_;
 wire _0706_;
 wire _0707_;
 wire _0708_;
 wire _0709_;
 wire _0710_;
 wire _0711_;
 wire _0712_;
 wire _0713_;
 wire _0714_;
 wire _0715_;
 wire _0716_;
 wire _0717_;
 wire _0718_;
 wire _0719_;
 wire _0720_;
 wire _0721_;
 wire _0722_;
 wire _0723_;
 wire _0724_;
 wire _0725_;
 wire _0726_;
 wire _0727_;
 wire _0728_;
 wire _0729_;
 wire _0730_;
 wire _0731_;
 wire _0732_;
 wire _0733_;
 wire _0734_;
 wire _0735_;
 wire _0736_;
 wire _0737_;
 wire _0738_;
 wire _0739_;
 wire _0740_;
 wire _0741_;
 wire _0742_;
 wire _0743_;
 wire _0744_;
 wire _0745_;
 wire _0746_;
 wire _0747_;
 wire _0748_;
 wire _0749_;
 wire _0750_;
 wire _0751_;
 wire _0752_;
 wire _0753_;
 wire _0754_;
 wire _0755_;
 wire _0756_;
 wire _0757_;
 wire _0758_;
 wire _0759_;
 wire _0760_;
 wire _0761_;
 wire _0762_;
 wire _0763_;
 wire _0764_;
 wire _0765_;
 wire _0766_;
 wire _0767_;
 wire _0768_;
 wire _0769_;
 wire _0770_;
 wire _0771_;
 wire _0772_;
 wire _0773_;
 wire _0774_;
 wire _0775_;
 wire _0776_;
 wire _0777_;
 wire _0778_;
 wire _0779_;
 wire _0780_;
 wire _0781_;
 wire _0782_;
 wire _0783_;
 wire _0784_;
 wire _0785_;
 wire _0786_;
 wire _0787_;
 wire _0788_;
 wire _0789_;
 wire _0790_;
 wire _0791_;
 wire _0792_;
 wire _0793_;
 wire _0794_;
 wire _0795_;
 wire _0796_;
 wire _0797_;
 wire _0798_;
 wire _0799_;
 wire _0800_;
 wire _0801_;
 wire _0802_;
 wire _0803_;
 wire _0804_;
 wire _0805_;
 wire _0806_;
 wire _0807_;
 wire _0808_;
 wire _0809_;
 wire _0810_;
 wire _0811_;
 wire _0812_;
 wire _0813_;
 wire _0814_;
 wire _0815_;
 wire _0816_;
 wire _0817_;
 wire _0818_;
 wire _0819_;
 wire _0820_;
 wire _0821_;
 wire _0822_;
 wire _0823_;
 wire _0824_;
 wire _0825_;
 wire _0826_;
 wire _0827_;
 wire _0828_;
 wire _0829_;
 wire _0830_;
 wire _0831_;
 wire _0832_;
 wire _0833_;
 wire _0834_;
 wire _0835_;
 wire _0836_;
 wire _0837_;
 wire _0838_;
 wire _0839_;
 wire miso;
 wire sync;
 wire \u_pwm.pwm_en ;
 wire \u_pwm.u_pwm_core.wrap ;
 wire \u_pwm.u_rst_sync.rst_ff1 ;
 wire \u_pwm.u_rst_sync.rst_ff2 ;
 wire \u_pwm.u_spi.wr_toggle ;
 wire \u_pwm.u_wr_toggle_sync.sync_ff1 ;
 wire \u_pwm.u_wr_toggle_sync.sync_ff2 ;
 wire \u_pwm.wr_toggle_seen ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net38;
 wire net39;
 wire net40;
 wire net41;
 wire net42;
 wire net43;
 wire net44;
 wire net45;
 wire net46;
 wire net47;
 wire net48;
 wire net49;
 wire net50;
 wire net51;
 wire net52;
 wire net53;
 wire net54;
 wire net55;
 wire net56;
 wire net57;
 wire net58;
 wire net59;
 wire net60;
 wire net61;
 wire net62;
 wire net63;
 wire net64;
 wire net65;
 wire net66;
 wire net67;
 wire net68;
 wire net69;
 wire net70;
 wire net71;
 wire net72;
 wire net73;
 wire net74;
 wire net75;
 wire net76;
 wire net77;
 wire net78;
 wire net79;
 wire net80;
 wire net81;
 wire net82;
 wire net83;
 wire net84;
 wire net85;
 wire net86;
 wire net87;
 wire net88;
 wire net89;
 wire net90;
 wire net91;
 wire net92;
 wire net93;
 wire net94;
 wire net95;
 wire net96;
 wire net97;
 wire net98;
 wire net99;
 wire net100;
 wire net101;
 wire net102;
 wire net103;
 wire net104;
 wire net105;
 wire net106;
 wire net107;
 wire net108;
 wire net109;
 wire net110;
 wire net111;
 wire net112;
 wire net113;
 wire net114;
 wire net115;
 wire net116;
 wire net117;
 wire net118;
 wire net119;
 wire net120;
 wire net121;
 wire net122;
 wire net123;
 wire net124;
 wire net125;
 wire net126;
 wire net127;
 wire net128;
 wire net129;
 wire net130;
 wire net131;
 wire net132;
 wire net133;
 wire net134;
 wire net135;
 wire net136;
 wire net137;
 wire net138;
 wire net139;
 wire net140;
 wire net141;
 wire net142;
 wire net143;
 wire net144;
 wire net145;
 wire net146;
 wire net147;
 wire net148;
 wire net149;
 wire net150;
 wire net151;
 wire net152;
 wire net153;
 wire net154;
 wire net155;
 wire net156;
 wire net157;
 wire net158;
 wire net159;
 wire net160;
 wire net161;
 wire net162;
 wire net163;
 wire net164;
 wire net165;
 wire net166;
 wire net167;
 wire net168;
 wire net169;
 wire net170;
 wire net171;
 wire net172;
 wire net173;
 wire net174;
 wire net175;
 wire net176;
 wire net177;
 wire net178;
 wire net179;
 wire net180;
 wire net181;
 wire net182;
 wire net183;
 wire net184;
 wire net185;
 wire net186;
 wire net187;
 wire net188;
 wire net189;
 wire net190;
 wire net191;
 wire net192;
 wire net193;
 wire net194;
 wire net195;
 wire net196;
 wire net197;
 wire net198;
 wire net199;
 wire net200;
 wire net201;
 wire net202;
 wire net203;
 wire net204;
 wire net205;
 wire net206;
 wire net207;
 wire net208;
 wire net209;
 wire net210;
 wire net211;
 wire net212;
 wire net213;
 wire net214;
 wire net215;
 wire net216;
 wire net217;
 wire net218;
 wire net219;
 wire net220;
 wire net221;
 wire net222;
 wire net223;
 wire net224;
 wire net225;
 wire net226;
 wire net227;
 wire net228;
 wire net229;
 wire net230;
 wire net231;
 wire net232;
 wire net233;
 wire net234;
 wire net235;
 wire net236;
 wire net237;
 wire net238;
 wire net239;
 wire net240;
 wire net241;
 wire net242;
 wire net243;
 wire net244;
 wire net245;
 wire net246;
 wire net247;
 wire net248;
 wire net249;
 wire net250;
 wire net251;
 wire net252;
 wire net253;
 wire net254;
 wire net255;
 wire net256;
 wire net257;
 wire net258;
 wire net259;
 wire net260;
 wire net261;
 wire net262;
 wire net263;
 wire net264;
 wire net265;
 wire net266;
 wire net267;
 wire net268;
 wire net269;
 wire net270;
 wire net271;
 wire net272;
 wire net273;
 wire net274;
 wire net275;
 wire net276;
 wire net277;
 wire net278;
 wire net279;
 wire net280;
 wire net281;
 wire net282;
 wire net283;
 wire net284;
 wire net285;
 wire net286;
 wire net287;
 wire net288;
 wire net289;
 wire net290;
 wire net291;
 wire net292;
 wire net293;
 wire net294;
 wire net295;
 wire net296;
 wire net297;
 wire net298;
 wire net299;
 wire net300;
 wire net301;
 wire net302;
 wire net303;
 wire net304;
 wire net305;
 wire net306;
 wire net307;
 wire net308;
 wire net309;
 wire net310;
 wire net311;
 wire net312;
 wire net313;
 wire net314;
 wire net315;
 wire net316;
 wire net317;
 wire net318;
 wire net319;
 wire net320;
 wire net321;
 wire net322;
 wire net323;
 wire net324;
 wire net325;
 wire net326;
 wire net327;
 wire net328;
 wire net329;
 wire net330;
 wire net331;
 wire net332;
 wire net333;
 wire net334;
 wire net335;
 wire net336;
 wire net337;
 wire net338;
 wire net339;
 wire net340;
 wire net341;
 wire net342;
 wire net343;
 wire net344;
 wire net345;
 wire net346;
 wire net347;
 wire net348;
 wire net349;
 wire net350;
 wire net351;
 wire net352;
 wire net353;
 wire net354;
 wire net355;
 wire net356;
 wire net357;
 wire net358;
 wire net359;
 wire net360;
 wire net361;
 wire net362;
 wire net363;
 wire net364;
 wire net365;
 wire net366;
 wire net367;
 wire net368;
 wire net369;
 wire net370;
 wire net371;
 wire net372;
 wire net373;
 wire net374;
 wire net375;
 wire net376;
 wire net377;
 wire net378;
 wire net379;
 wire net380;
 wire net381;
 wire net382;
 wire net383;
 wire net384;
 wire net385;
 wire net386;
 wire net387;
 wire net388;
 wire net389;
 wire net390;
 wire net391;
 wire net392;
 wire net393;
 wire net394;
 wire net395;
 wire net396;
 wire net397;
 wire net398;
 wire net399;
 wire net400;
 wire net401;
 wire net402;
 wire net403;
 wire net404;
 wire net405;
 wire net406;
 wire net407;
 wire net408;
 wire net409;
 wire net410;
 wire net411;
 wire net412;
 wire net413;
 wire net414;
 wire net415;
 wire net416;
 wire net417;
 wire net418;
 wire net419;
 wire net420;
 wire net421;
 wire net422;
 wire net423;
 wire net424;
 wire net425;
 wire net426;
 wire net427;
 wire net428;
 wire net429;
 wire net430;
 wire net431;
 wire net432;
 wire net433;
 wire net434;
 wire net435;
 wire net436;
 wire net437;
 wire net438;
 wire net439;
 wire net440;
 wire net441;
 wire net442;
 wire net443;
 wire net444;
 wire net445;
 wire net446;
 wire net447;
 wire net448;
 wire clknet_0_clk;
 wire clknet_4_0_0_clk;
 wire clknet_4_1_0_clk;
 wire clknet_4_2_0_clk;
 wire clknet_4_3_0_clk;
 wire clknet_4_4_0_clk;
 wire clknet_4_5_0_clk;
 wire clknet_4_6_0_clk;
 wire clknet_4_7_0_clk;
 wire clknet_4_8_0_clk;
 wire clknet_4_9_0_clk;
 wire clknet_4_10_0_clk;
 wire clknet_4_11_0_clk;
 wire clknet_4_12_0_clk;
 wire clknet_4_13_0_clk;
 wire clknet_4_14_0_clk;
 wire clknet_4_15_0_clk;
 wire clknet_0_sclk;
 wire clknet_2_0__leaf_sclk;
 wire clknet_2_1__leaf_sclk;
 wire clknet_2_2__leaf_sclk;
 wire clknet_2_3__leaf_sclk;
 wire [0:0] _0628_;
 wire [3:0] _0629_;
 wire [7:0] pwm_out;
 wire [63:0] \u_pwm.duty ;
 wire [7:0] \u_pwm.prescaler ;
 wire [6:0] \u_pwm.rd_addr ;
 wire [63:0] \u_pwm.u_pwm_core.duty_active ;
 wire [7:0] \u_pwm.u_pwm_core.phase ;
 wire [7:0] \u_pwm.u_pwm_core.prescale_count ;
 wire [7:0] \u_pwm.u_pwm_core.pwm_next ;
 wire [6:0] \u_pwm.u_reg_bank.wr_addr ;
 wire [7:0] \u_pwm.u_reg_bank.wr_data ;
 wire [3:0] \u_pwm.u_spi.bit_cnt ;
 wire [14:0] \u_pwm.u_spi.shift_in ;
 wire [6:0] \u_pwm.u_spi.shift_out ;

 INVR01 _0840_ (.OUT1(_0225_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_out [6]),
    .VDD(VDD));
 INVR01 _0841_ (.OUT1(_0226_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_out [5]),
    .VDD(VDD));
 INVR01 _0842_ (.OUT1(_0227_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_out [4]),
    .VDD(VDD));
 INVR01 _0843_ (.OUT1(_0228_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_out [3]),
    .VDD(VDD));
 INVR01 _0844_ (.OUT1(_0229_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_out [2]),
    .VDD(VDD));
 INVR01 _0845_ (.OUT1(_0230_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_out [1]),
    .VDD(VDD));
 INVR02 _0846_ (.OUT1(_0231_),
    .VSS(VSS),
    .IN1(rst_n),
    .VDD(VDD));
 INVR01 _0847_ (.OUT1(_0232_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [1]),
    .VDD(VDD));
 INVR01 _0848_ (.OUT1(_0233_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [2]),
    .VDD(VDD));
 INVR01 _0849_ (.OUT1(_0234_),
    .VSS(VSS),
    .IN1(\u_pwm.prescaler [7]),
    .VDD(VDD));
 INVR01 _0850_ (.OUT1(_0235_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [6]),
    .VDD(VDD));
 INVR01 _0851_ (.OUT1(_0236_),
    .VSS(VSS),
    .IN1(\u_pwm.prescaler [5]),
    .VDD(VDD));
 INVR01 _0852_ (.OUT1(_0237_),
    .VSS(VSS),
    .IN1(net354),
    .VDD(VDD));
 INVR01 _0853_ (.OUT1(_0238_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [3]),
    .VDD(VDD));
 INVR01 _0854_ (.OUT1(_0239_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [2]),
    .VDD(VDD));
 INVR01 _0855_ (.OUT1(_0240_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [1]),
    .VDD(VDD));
 INVR01 _0856_ (.OUT1(_0241_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [0]),
    .VDD(VDD));
 INVR02 _0857_ (.OUT1(_0242_),
    .VSS(VSS),
    .IN1(net375),
    .VDD(VDD));
 INVR03 _0858_ (.OUT1(_0243_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [1]),
    .VDD(VDD));
 INVR02 _0859_ (.OUT1(_0244_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [0]),
    .VDD(VDD));
 INVR04 _0860_ (.OUT1(_0245_),
    .VSS(VSS),
    .IN1(net74),
    .VDD(VDD));
 INVR04 _0861_ (.OUT1(_0246_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [2]),
    .VDD(VDD));
 INVR04 _0862_ (.OUT1(_0247_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [5]),
    .VDD(VDD));
 INVR05 _0863_ (.OUT1(_0248_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [4]),
    .VDD(VDD));
 INVR03 _0864_ (.OUT1(_0249_),
    .VSS(VSS),
    .IN1(net73),
    .VDD(VDD));
 INVR05 _0865_ (.OUT1(_0250_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [7]),
    .VDD(VDD));
 INVR02 _0866_ (.OUT1(_0251_),
    .VSS(VSS),
    .IN1(net128),
    .VDD(VDD));
 INVR01 _0867_ (.OUT1(_0252_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.duty_active [19]),
    .VDD(VDD));
 INVR01 _0868_ (.OUT1(_0253_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.duty_active [46]),
    .VDD(VDD));
 INVR01 _0869_ (.OUT1(_0254_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.duty_active [49]),
    .VDD(VDD));
 INVR01 _0870_ (.OUT1(_0255_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.duty_active [62]),
    .VDD(VDD));
 INVR01 _0871_ (.OUT1(_0256_),
    .VSS(VSS),
    .IN1(net260),
    .VDD(VDD));
 INVR01 _0872_ (.OUT1(_0257_),
    .VSS(VSS),
    .IN1(net258),
    .VDD(VDD));
 INVR01 _0873_ (.OUT1(_0258_),
    .VSS(VSS),
    .IN1(\u_pwm.rd_addr [3]),
    .VDD(VDD));
 INVR01 _0874_ (.OUT1(_0028_),
    .VSS(VSS),
    .IN1(clknet_2_3__leaf_sclk),
    .VDD(VDD));
 NOR200 _0875_ (.OUT1(_0041_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net447),
    .VDD(VDD));
 NOR200 _0876_ (.OUT1(_0259_),
    .VSS(VSS),
    .IN1(miso),
    .IN2(\u_pwm.u_spi.bit_cnt [3]),
    .VDD(VDD));
 NOR200 _0877_ (.OUT1(_0260_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.bit_cnt [0]),
    .IN2(\u_pwm.u_spi.bit_cnt [1]),
    .VDD(VDD));
 NOR200 _0878_ (.OUT1(_0261_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.bit_cnt [2]),
    .IN2(net63),
    .VDD(VDD));
 NND201 _0879_ (.OUT1(_0262_),
    .VSS(VSS),
    .IN1(_0260_),
    .IN2(_0261_),
    .VDD(VDD));
 INVR01 _0880_ (.OUT1(_0263_),
    .VSS(VSS),
    .IN1(_0262_),
    .VDD(VDD));
 ADNR01 _0881_ (.A(_0225_),
    .B(net128),
    .C(_0263_),
    .OUT1(_0264_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0882_ (.OUT1(_0265_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_in [7]),
    .IN2(_0263_),
    .VDD(VDD));
 NND201 _0883_ (.OUT1(_0266_),
    .VSS(VSS),
    .IN1(net262),
    .IN2(_0256_),
    .VDD(VDD));
 NOR300 _0884_ (.OUT1(_0267_),
    .VSS(VSS),
    .IN1(net255),
    .IN2(net256),
    .IN3(\u_pwm.rd_addr [6]),
    .VDD(VDD));
 AND201 _0885_ (.OUT1(_0268_),
    .VSS(VSS),
    .IN1(_0257_),
    .IN2(_0267_),
    .VDD(VDD));
 NND201 _0886_ (.OUT1(_0269_),
    .VSS(VSS),
    .IN1(\u_pwm.rd_addr [3]),
    .IN2(_0268_),
    .VDD(VDD));
 NOR200 _0887_ (.OUT1(_0270_),
    .VSS(VSS),
    .IN1(_0266_),
    .IN2(_0269_),
    .VDD(VDD));
 NND201 _0888_ (.OUT1(_0271_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [63]),
    .IN2(net56),
    .VDD(VDD));
 OR2101 _0889_ (.OUT1(_0272_),
    .VSS(VSS),
    .IN1(net262),
    .IN2(net260),
    .VDD(VDD));
 NOR201 _0890_ (.OUT1(_0273_),
    .VSS(VSS),
    .IN1(_0269_),
    .IN2(_0272_),
    .VDD(VDD));
 NND201 _0891_ (.OUT1(_0274_),
    .VSS(VSS),
    .IN1(net428),
    .IN2(net54),
    .VDD(VDD));
 NND201 _0892_ (.OUT1(_0275_),
    .VSS(VSS),
    .IN1(_0258_),
    .IN2(_0268_),
    .VDD(VDD));
 OR2101 _0893_ (.OUT1(_0276_),
    .VSS(VSS),
    .IN1(net262),
    .IN2(_0256_),
    .VDD(VDD));
 NOR201 _0894_ (.OUT1(_0277_),
    .VSS(VSS),
    .IN1(_0275_),
    .IN2(_0276_),
    .VDD(VDD));
 NND201 _0895_ (.OUT1(_0278_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [7]),
    .IN2(net53),
    .VDD(VDD));
 NND201 _0896_ (.OUT1(_0279_),
    .VSS(VSS),
    .IN1(net262),
    .IN2(net260),
    .VDD(VDD));
 NOR200 _0897_ (.OUT1(_0280_),
    .VSS(VSS),
    .IN1(_0275_),
    .IN2(_0279_),
    .VDD(VDD));
 NND201 _0898_ (.OUT1(_0281_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [15]),
    .IN2(net52),
    .VDD(VDD));
 NOR200 _0899_ (.OUT1(_0282_),
    .VSS(VSS),
    .IN1(_0257_),
    .IN2(\u_pwm.rd_addr [3]),
    .VDD(VDD));
 NND201 _0900_ (.OUT1(_0283_),
    .VSS(VSS),
    .IN1(_0267_),
    .IN2(_0282_),
    .VDD(VDD));
 NOR201 _0901_ (.OUT1(_0284_),
    .VSS(VSS),
    .IN1(_0266_),
    .IN2(_0283_),
    .VDD(VDD));
 NND201 _0902_ (.OUT1(_0285_),
    .VSS(VSS),
    .IN1(net339),
    .IN2(net50),
    .VDD(VDD));
 NOR201 _0903_ (.OUT1(_0286_),
    .VSS(VSS),
    .IN1(_0269_),
    .IN2(_0276_),
    .VDD(VDD));
 NOR201 _0904_ (.OUT1(_0287_),
    .VSS(VSS),
    .IN1(_0279_),
    .IN2(_0283_),
    .VDD(VDD));
 ADNR01 _0905_ (.A(net359),
    .B(net48),
    .C(_0286_),
    .OUT1(_0288_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _0906_ (.OUT1(_0289_),
    .VSS(VSS),
    .IN1(_0266_),
    .IN2(_0275_),
    .VDD(VDD));
 NOR300 _0907_ (.OUT1(_0290_),
    .VSS(VSS),
    .IN1(_0234_),
    .IN2(_0266_),
    .IN3(_0275_),
    .VDD(VDD));
 NOR201 _0908_ (.OUT1(_0291_),
    .VSS(VSS),
    .IN1(_0276_),
    .IN2(_0283_),
    .VDD(VDD));
 NND201 _0909_ (.OUT1(_0292_),
    .VSS(VSS),
    .IN1(net294),
    .IN2(net45),
    .VDD(VDD));
 NOR201 _0910_ (.OUT1(_0293_),
    .VSS(VSS),
    .IN1(_0272_),
    .IN2(_0283_),
    .VDD(VDD));
 NND201 _0911_ (.OUT1(_0294_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [23]),
    .IN2(net44),
    .VDD(VDD));
 NND201 _0912_ (.OUT1(_0295_),
    .VSS(VSS),
    .IN1(_0278_),
    .IN2(_0285_),
    .VDD(VDD));
 NND601 _0913_ (.OUT1(_0296_),
    .VSS(VSS),
    .IN1(_0271_),
    .IN2(_0274_),
    .IN3(_0281_),
    .IN4(_0288_),
    .IN5(_0292_),
    .IN6(_0294_),
    .VDD(VDD));
 NOR300 _0914_ (.OUT1(_0297_),
    .VSS(VSS),
    .IN1(_0290_),
    .IN2(_0295_),
    .IN3(_0296_),
    .VDD(VDD));
 NOR200 _0915_ (.OUT1(_0298_),
    .VSS(VSS),
    .IN1(_0265_),
    .IN2(_0297_),
    .VDD(VDD));
 NOR200 _0916_ (.OUT1(_0299_),
    .VSS(VSS),
    .IN1(_0264_),
    .IN2(_0298_),
    .VDD(VDD));
 NOR200 _0917_ (.OUT1(_0191_),
    .VSS(VSS),
    .IN1(_0259_),
    .IN2(_0299_),
    .VDD(VDD));
 ADNR01 _0918_ (.A(_0226_),
    .B(net128),
    .C(_0263_),
    .OUT1(_0300_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0919_ (.OUT1(_0301_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [54]),
    .IN2(net54),
    .VDD(VDD));
 NND201 _0920_ (.OUT1(_0302_),
    .VSS(VSS),
    .IN1(net326),
    .IN2(net53),
    .VDD(VDD));
 NND201 _0921_ (.OUT1(_0303_),
    .VSS(VSS),
    .IN1(_0301_),
    .IN2(_0302_),
    .VDD(VDD));
 ADNR01 _0922_ (.A(\u_pwm.duty [14]),
    .B(net51),
    .C(_0303_),
    .OUT1(_0304_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0923_ (.OUT1(_0305_),
    .VSS(VSS),
    .IN1(net361),
    .IN2(net48),
    .VDD(VDD));
 NND201 _0924_ (.OUT1(_0306_),
    .VSS(VSS),
    .IN1(net281),
    .IN2(net44),
    .VDD(VDD));
 NND201 _0925_ (.OUT1(_0307_),
    .VSS(VSS),
    .IN1(_0305_),
    .IN2(_0306_),
    .VDD(VDD));
 NND201 _0926_ (.OUT1(_0308_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [38]),
    .IN2(net46),
    .VDD(VDD));
 NND201 _0927_ (.OUT1(_0309_),
    .VSS(VSS),
    .IN1(net341),
    .IN2(net50),
    .VDD(VDD));
 NND201 _0928_ (.OUT1(_0310_),
    .VSS(VSS),
    .IN1(_0308_),
    .IN2(_0309_),
    .VDD(VDD));
 NND201 _0929_ (.OUT1(_0311_),
    .VSS(VSS),
    .IN1(\u_pwm.prescaler [6]),
    .IN2(_0289_),
    .VDD(VDD));
 NND201 _0930_ (.OUT1(_0312_),
    .VSS(VSS),
    .IN1(net265),
    .IN2(net56),
    .VDD(VDD));
 NND201 _0931_ (.OUT1(_0313_),
    .VSS(VSS),
    .IN1(_0311_),
    .IN2(_0312_),
    .VDD(VDD));
 NOR300 _0932_ (.OUT1(_0314_),
    .VSS(VSS),
    .IN1(_0307_),
    .IN2(_0310_),
    .IN3(_0313_),
    .VDD(VDD));
 ADNR01 _0933_ (.A(_0304_),
    .B(_0314_),
    .C(_0265_),
    .OUT1(_0315_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _0934_ (.OUT1(_0316_),
    .VSS(VSS),
    .IN1(_0300_),
    .IN2(_0315_),
    .VDD(VDD));
 ADNR01 _0935_ (.A(_0225_),
    .B(_0251_),
    .C(_0316_),
    .OUT1(_0190_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _0936_ (.A(_0227_),
    .B(net128),
    .C(_0263_),
    .OUT1(_0317_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0937_ (.OUT1(_0318_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [53]),
    .IN2(net54),
    .VDD(VDD));
 NND201 _0938_ (.OUT1(_0319_),
    .VSS(VSS),
    .IN1(net314),
    .IN2(net52),
    .VDD(VDD));
 NND201 _0939_ (.OUT1(_0320_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [45]),
    .IN2(net48),
    .VDD(VDD));
 NND201 _0940_ (.OUT1(_0321_),
    .VSS(VSS),
    .IN1(net298),
    .IN2(net45),
    .VDD(VDD));
 NND201 _0941_ (.OUT1(_0322_),
    .VSS(VSS),
    .IN1(net283),
    .IN2(net44),
    .VDD(VDD));
 NND201 _0942_ (.OUT1(_0323_),
    .VSS(VSS),
    .IN1(\u_pwm.prescaler [5]),
    .IN2(net47),
    .VDD(VDD));
 AOI401 _0943_ (.A(net328),
    .B(net53),
    .C(_0284_),
    .D(net344),
    .OUT1(_0324_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0944_ (.OUT1(_0325_),
    .VSS(VSS),
    .IN1(_0323_),
    .IN2(_0324_),
    .VDD(VDD));
 ADNR01 _0945_ (.A(\u_pwm.duty [61]),
    .B(net56),
    .C(_0286_),
    .OUT1(_0326_),
    .VSS(VSS),
    .VDD(VDD));
 NND601 _0946_ (.OUT1(_0327_),
    .VSS(VSS),
    .IN1(_0318_),
    .IN2(_0319_),
    .IN3(_0320_),
    .IN4(_0321_),
    .IN5(_0322_),
    .IN6(_0326_),
    .VDD(VDD));
 NOR200 _0947_ (.OUT1(_0328_),
    .VSS(VSS),
    .IN1(_0325_),
    .IN2(_0327_),
    .VDD(VDD));
 NOR200 _0948_ (.OUT1(_0329_),
    .VSS(VSS),
    .IN1(_0265_),
    .IN2(_0328_),
    .VDD(VDD));
 NOR200 _0949_ (.OUT1(_0330_),
    .VSS(VSS),
    .IN1(_0317_),
    .IN2(_0329_),
    .VDD(VDD));
 ADNR01 _0950_ (.A(_0226_),
    .B(_0251_),
    .C(_0330_),
    .OUT1(_0189_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _0951_ (.A(_0228_),
    .B(net128),
    .C(_0263_),
    .OUT1(_0331_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0952_ (.OUT1(_0332_),
    .VSS(VSS),
    .IN1(\u_pwm.prescaler [4]),
    .IN2(net47),
    .VDD(VDD));
 NND201 _0953_ (.OUT1(_0333_),
    .VSS(VSS),
    .IN1(net330),
    .IN2(net53),
    .VDD(VDD));
 NND201 _0954_ (.OUT1(_0334_),
    .VSS(VSS),
    .IN1(net285),
    .IN2(net44),
    .VDD(VDD));
 NND201 _0955_ (.OUT1(_0335_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [44]),
    .IN2(net49),
    .VDD(VDD));
 NND201 _0956_ (.OUT1(_0336_),
    .VSS(VSS),
    .IN1(net300),
    .IN2(net45),
    .VDD(VDD));
 NND201 _0957_ (.OUT1(_0337_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [52]),
    .IN2(net54),
    .VDD(VDD));
 NND201 _0958_ (.OUT1(_0338_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [60]),
    .IN2(net56),
    .VDD(VDD));
 AOI401 _0959_ (.A(net316),
    .B(net52),
    .C(net50),
    .D(net345),
    .OUT1(_0339_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0960_ (.OUT1(_0340_),
    .VSS(VSS),
    .IN1(_0335_),
    .IN2(_0339_),
    .VDD(VDD));
 NND601 _0961_ (.OUT1(_0341_),
    .VSS(VSS),
    .IN1(_0332_),
    .IN2(_0333_),
    .IN3(_0334_),
    .IN4(_0336_),
    .IN5(_0337_),
    .IN6(_0338_),
    .VDD(VDD));
 NOR200 _0962_ (.OUT1(_0342_),
    .VSS(VSS),
    .IN1(_0340_),
    .IN2(_0341_),
    .VDD(VDD));
 NOR200 _0963_ (.OUT1(_0343_),
    .VSS(VSS),
    .IN1(_0265_),
    .IN2(_0342_),
    .VDD(VDD));
 NOR200 _0964_ (.OUT1(_0344_),
    .VSS(VSS),
    .IN1(_0331_),
    .IN2(_0343_),
    .VDD(VDD));
 ADNR01 _0965_ (.A(_0227_),
    .B(_0251_),
    .C(_0344_),
    .OUT1(_0188_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _0966_ (.A(_0229_),
    .B(net128),
    .C(_0263_),
    .OUT1(_0345_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0967_ (.OUT1(_0346_),
    .VSS(VSS),
    .IN1(\u_pwm.prescaler [3]),
    .IN2(net47),
    .VDD(VDD));
 NND201 _0968_ (.OUT1(_0347_),
    .VSS(VSS),
    .IN1(net332),
    .IN2(net53),
    .VDD(VDD));
 NND201 _0969_ (.OUT1(_0348_),
    .VSS(VSS),
    .IN1(net286),
    .IN2(net44),
    .VDD(VDD));
 NND201 _0970_ (.OUT1(_0349_),
    .VSS(VSS),
    .IN1(net367),
    .IN2(net49),
    .VDD(VDD));
 NND201 _0971_ (.OUT1(_0350_),
    .VSS(VSS),
    .IN1(net302),
    .IN2(net45),
    .VDD(VDD));
 NND201 _0972_ (.OUT1(_0351_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [51]),
    .IN2(net54),
    .VDD(VDD));
 NND201 _0973_ (.OUT1(_0352_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [59]),
    .IN2(net56),
    .VDD(VDD));
 AOI401 _0974_ (.A(net317),
    .B(net51),
    .C(_0284_),
    .D(net346),
    .OUT1(_0353_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0975_ (.OUT1(_0354_),
    .VSS(VSS),
    .IN1(_0349_),
    .IN2(_0353_),
    .VDD(VDD));
 NND601 _0976_ (.OUT1(_0355_),
    .VSS(VSS),
    .IN1(_0346_),
    .IN2(_0347_),
    .IN3(_0348_),
    .IN4(_0350_),
    .IN5(_0351_),
    .IN6(_0352_),
    .VDD(VDD));
 NOR200 _0977_ (.OUT1(_0356_),
    .VSS(VSS),
    .IN1(_0354_),
    .IN2(_0355_),
    .VDD(VDD));
 NOR200 _0978_ (.OUT1(_0357_),
    .VSS(VSS),
    .IN1(_0265_),
    .IN2(_0356_),
    .VDD(VDD));
 NOR200 _0979_ (.OUT1(_0358_),
    .VSS(VSS),
    .IN1(_0345_),
    .IN2(_0357_),
    .VDD(VDD));
 ADNR01 _0980_ (.A(_0228_),
    .B(net63),
    .C(_0358_),
    .OUT1(_0187_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _0981_ (.A(_0230_),
    .B(\u_pwm.u_spi.bit_cnt [3]),
    .C(_0263_),
    .OUT1(_0359_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0982_ (.OUT1(_0360_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [50]),
    .IN2(net55),
    .VDD(VDD));
 NND201 _0983_ (.OUT1(_0361_),
    .VSS(VSS),
    .IN1(net319),
    .IN2(net51),
    .VDD(VDD));
 NND201 _0984_ (.OUT1(_0362_),
    .VSS(VSS),
    .IN1(net369),
    .IN2(net48),
    .VDD(VDD));
 NND201 _0985_ (.OUT1(_0363_),
    .VSS(VSS),
    .IN1(net304),
    .IN2(net45),
    .VDD(VDD));
 NND201 _0986_ (.OUT1(_0364_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [18]),
    .IN2(_0293_),
    .VDD(VDD));
 NND201 _0987_ (.OUT1(_0365_),
    .VSS(VSS),
    .IN1(\u_pwm.prescaler [2]),
    .IN2(net47),
    .VDD(VDD));
 AOI401 _0988_ (.A(net334),
    .B(_0277_),
    .C(_0284_),
    .D(net348),
    .OUT1(_0366_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _0989_ (.OUT1(_0367_),
    .VSS(VSS),
    .IN1(_0365_),
    .IN2(_0366_),
    .VDD(VDD));
 ADNR01 _0990_ (.A(\u_pwm.duty [58]),
    .B(net56),
    .C(_0286_),
    .OUT1(_0368_),
    .VSS(VSS),
    .VDD(VDD));
 NND601 _0991_ (.OUT1(_0369_),
    .VSS(VSS),
    .IN1(_0360_),
    .IN2(_0361_),
    .IN3(_0362_),
    .IN4(_0363_),
    .IN5(_0364_),
    .IN6(_0368_),
    .VDD(VDD));
 NOR200 _0992_ (.OUT1(_0370_),
    .VSS(VSS),
    .IN1(_0367_),
    .IN2(_0369_),
    .VDD(VDD));
 NOR200 _0993_ (.OUT1(_0371_),
    .VSS(VSS),
    .IN1(_0265_),
    .IN2(_0370_),
    .VDD(VDD));
 NOR200 _0994_ (.OUT1(_0372_),
    .VSS(VSS),
    .IN1(_0359_),
    .IN2(_0371_),
    .VDD(VDD));
 ADNR01 _0995_ (.A(_0229_),
    .B(_0251_),
    .C(_0372_),
    .OUT1(_0186_),
    .VSS(VSS),
    .VDD(VDD));
 OR2101 _0996_ (.OUT1(_0373_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_out [0]),
    .IN2(net63),
    .VDD(VDD));
 NND201 _0997_ (.OUT1(_0374_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [49]),
    .IN2(net55),
    .VDD(VDD));
 NND201 _0998_ (.OUT1(_0375_),
    .VSS(VSS),
    .IN1(net335),
    .IN2(_0277_),
    .VDD(VDD));
 NND201 _0999_ (.OUT1(_0376_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [33]),
    .IN2(_0291_),
    .VDD(VDD));
 NND201 _1000_ (.OUT1(_0377_),
    .VSS(VSS),
    .IN1(net350),
    .IN2(net50),
    .VDD(VDD));
 NND201 _1001_ (.OUT1(_0378_),
    .VSS(VSS),
    .IN1(net370),
    .IN2(_0287_),
    .VDD(VDD));
 NND201 _1002_ (.OUT1(_0379_),
    .VSS(VSS),
    .IN1(\u_pwm.duty [57]),
    .IN2(_0270_),
    .VDD(VDD));
 NND201 _1003_ (.OUT1(_0380_),
    .VSS(VSS),
    .IN1(\u_pwm.prescaler [1]),
    .IN2(net47),
    .VDD(VDD));
 AOI401 _1004_ (.A(net321),
    .B(_0280_),
    .C(_0293_),
    .D(\u_pwm.duty [17]),
    .OUT1(_0381_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1005_ (.OUT1(_0382_),
    .VSS(VSS),
    .IN1(_0379_),
    .IN2(_0381_),
    .VDD(VDD));
 NND601 _1006_ (.OUT1(_0383_),
    .VSS(VSS),
    .IN1(_0374_),
    .IN2(_0375_),
    .IN3(_0376_),
    .IN4(_0377_),
    .IN5(_0378_),
    .IN6(_0380_),
    .VDD(VDD));
 NOR200 _1007_ (.OUT1(_0384_),
    .VSS(VSS),
    .IN1(_0382_),
    .IN2(_0383_),
    .VDD(VDD));
 NOR200 _1008_ (.OUT1(_0385_),
    .VSS(VSS),
    .IN1(_0265_),
    .IN2(_0384_),
    .VDD(VDD));
 ADNR01 _1009_ (.A(_0262_),
    .B(_0373_),
    .C(_0385_),
    .OUT1(_0386_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1010_ (.A(_0230_),
    .B(net63),
    .C(_0386_),
    .OUT1(_0185_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1011_ (.OUT1(_0387_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.shift_out [0]),
    .IN2(net63),
    .VDD(VDD));
 AOI401 _1012_ (.A(\u_pwm.duty [48]),
    .B(net55),
    .C(_0289_),
    .D(\u_pwm.prescaler [0]),
    .OUT1(_0388_),
    .VSS(VSS),
    .VDD(VDD));
 AOI401 _1013_ (.A(\u_pwm.duty [56]),
    .B(_0270_),
    .C(_0277_),
    .D(\u_pwm.duty [0]),
    .OUT1(_0389_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1014_ (.OUT1(_0390_),
    .VSS(VSS),
    .IN1(_0388_),
    .IN2(_0389_),
    .VDD(VDD));
 AOI401 _1015_ (.A(net351),
    .B(net50),
    .C(net49),
    .D(net371),
    .OUT1(_0391_),
    .VSS(VSS),
    .VDD(VDD));
 NOR300 _1016_ (.OUT1(_0392_),
    .VSS(VSS),
    .IN1(net72),
    .IN2(_0272_),
    .IN3(_0275_),
    .VDD(VDD));
 ADNR01 _1017_ (.A(\u_pwm.duty [32]),
    .B(net46),
    .C(_0392_),
    .OUT1(_0393_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1018_ (.OUT1(_0394_),
    .VSS(VSS),
    .IN1(_0391_),
    .IN2(_0393_),
    .VDD(VDD));
 NND201 _1019_ (.OUT1(_0395_),
    .VSS(VSS),
    .IN1(net323),
    .IN2(net52),
    .VDD(VDD));
 ADNR01 _1020_ (.A(\u_pwm.duty [16]),
    .B(_0293_),
    .C(_0286_),
    .OUT1(_0396_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1021_ (.OUT1(_0397_),
    .VSS(VSS),
    .IN1(_0395_),
    .IN2(_0396_),
    .VDD(VDD));
 NOR300 _1022_ (.OUT1(_0398_),
    .VSS(VSS),
    .IN1(_0390_),
    .IN2(_0394_),
    .IN3(_0397_),
    .VDD(VDD));
 ORND01 _1023_ (.A(_0265_),
    .B(_0398_),
    .C(_0387_),
    .OUT1(_0184_),
    .VSS(VSS),
    .VDD(VDD));
 AOI401 _1024_ (.A(net71),
    .B(\u_pwm.u_pwm_core.duty_active [1]),
    .C(\u_pwm.u_pwm_core.duty_active [0]),
    .D(net70),
    .OUT1(_0399_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1025_ (.OUT1(_0400_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [2]),
    .VDD(VDD));
 NOR200 _1026_ (.OUT1(_0401_),
    .VSS(VSS),
    .IN1(net71),
    .IN2(\u_pwm.u_pwm_core.duty_active [1]),
    .VDD(VDD));
 NOR300 _1027_ (.OUT1(_0402_),
    .VSS(VSS),
    .IN1(_0399_),
    .IN2(_0400_),
    .IN3(_0401_),
    .VDD(VDD));
 NND201 _1028_ (.OUT1(_0403_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [2]),
    .VDD(VDD));
 NND201 _1029_ (.OUT1(_0404_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(net425),
    .VDD(VDD));
 NND201 _1030_ (.OUT1(_0405_),
    .VSS(VSS),
    .IN1(_0403_),
    .IN2(_0404_),
    .VDD(VDD));
 NOR200 _1031_ (.OUT1(_0406_),
    .VSS(VSS),
    .IN1(_0402_),
    .IN2(_0405_),
    .VDD(VDD));
 NOR200 _1032_ (.OUT1(_0407_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(net424),
    .VDD(VDD));
 NOR200 _1033_ (.OUT1(_0408_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(\u_pwm.u_pwm_core.duty_active [3]),
    .VDD(VDD));
 NOR300 _1034_ (.OUT1(_0409_),
    .VSS(VSS),
    .IN1(_0406_),
    .IN2(_0407_),
    .IN3(_0408_),
    .VDD(VDD));
 NND201 _1035_ (.OUT1(_0410_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(\u_pwm.u_pwm_core.duty_active [5]),
    .VDD(VDD));
 NND201 _1036_ (.OUT1(_0411_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(\u_pwm.u_pwm_core.duty_active [4]),
    .VDD(VDD));
 NND201 _1037_ (.OUT1(_0412_),
    .VSS(VSS),
    .IN1(_0410_),
    .IN2(_0411_),
    .VDD(VDD));
 NOR200 _1038_ (.OUT1(_0413_),
    .VSS(VSS),
    .IN1(_0409_),
    .IN2(_0412_),
    .VDD(VDD));
 NOR200 _1039_ (.OUT1(_0414_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(\u_pwm.u_pwm_core.duty_active [5]),
    .VDD(VDD));
 NOR200 _1040_ (.OUT1(_0415_),
    .VSS(VSS),
    .IN1(net65),
    .IN2(\u_pwm.u_pwm_core.duty_active [6]),
    .VDD(VDD));
 NOR300 _1041_ (.OUT1(_0416_),
    .VSS(VSS),
    .IN1(_0413_),
    .IN2(_0414_),
    .IN3(_0415_),
    .VDD(VDD));
 NND201 _1042_ (.OUT1(_0417_),
    .VSS(VSS),
    .IN1(net64),
    .IN2(\u_pwm.u_pwm_core.duty_active [7]),
    .VDD(VDD));
 ADNR01 _1043_ (.A(net65),
    .B(\u_pwm.u_pwm_core.duty_active [6]),
    .C(_0416_),
    .OUT1(_0418_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1044_ (.A(net64),
    .B(\u_pwm.u_pwm_core.duty_active [7]),
    .C(net372),
    .OUT1(_0419_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1045_ (.A(_0417_),
    .B(_0418_),
    .C(_0419_),
    .OUT1(\u_pwm.u_pwm_core.pwm_next [0]),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1046_ (.OUT1(_0420_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(\u_pwm.u_pwm_core.duty_active [11]),
    .VDD(VDD));
 NOR200 _1047_ (.OUT1(_0421_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [10]),
    .VDD(VDD));
 NND201 _1048_ (.OUT1(_0422_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [10]),
    .VDD(VDD));
 AOI401 _1049_ (.A(net71),
    .B(\u_pwm.u_pwm_core.duty_active [9]),
    .C(\u_pwm.u_pwm_core.duty_active [8]),
    .D(net70),
    .OUT1(_0423_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1050_ (.OUT1(_0424_),
    .VSS(VSS),
    .IN1(net71),
    .IN2(\u_pwm.u_pwm_core.duty_active [9]),
    .VDD(VDD));
 NOR300 _1051_ (.OUT1(_0425_),
    .VSS(VSS),
    .IN1(_0421_),
    .IN2(_0423_),
    .IN3(_0424_),
    .VDD(VDD));
 NND201 _1052_ (.OUT1(_0426_),
    .VSS(VSS),
    .IN1(_0420_),
    .IN2(_0422_),
    .VDD(VDD));
 NOR200 _1053_ (.OUT1(_0427_),
    .VSS(VSS),
    .IN1(_0425_),
    .IN2(_0426_),
    .VDD(VDD));
 NOR200 _1054_ (.OUT1(_0428_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(net417),
    .VDD(VDD));
 NOR200 _1055_ (.OUT1(_0429_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(\u_pwm.u_pwm_core.duty_active [11]),
    .VDD(VDD));
 NOR300 _1056_ (.OUT1(_0430_),
    .VSS(VSS),
    .IN1(_0427_),
    .IN2(_0428_),
    .IN3(_0429_),
    .VDD(VDD));
 NND201 _1057_ (.OUT1(_0431_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(net416),
    .VDD(VDD));
 NND201 _1058_ (.OUT1(_0432_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(\u_pwm.u_pwm_core.duty_active [12]),
    .VDD(VDD));
 NND201 _1059_ (.OUT1(_0433_),
    .VSS(VSS),
    .IN1(_0431_),
    .IN2(_0432_),
    .VDD(VDD));
 NOR200 _1060_ (.OUT1(_0434_),
    .VSS(VSS),
    .IN1(_0430_),
    .IN2(_0433_),
    .VDD(VDD));
 NOR200 _1061_ (.OUT1(_0435_),
    .VSS(VSS),
    .IN1(net65),
    .IN2(\u_pwm.u_pwm_core.duty_active [14]),
    .VDD(VDD));
 NOR200 _1062_ (.OUT1(_0436_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(\u_pwm.u_pwm_core.duty_active [13]),
    .VDD(VDD));
 NOR300 _1063_ (.OUT1(_0437_),
    .VSS(VSS),
    .IN1(_0434_),
    .IN2(_0435_),
    .IN3(_0436_),
    .VDD(VDD));
 NND201 _1064_ (.OUT1(_0438_),
    .VSS(VSS),
    .IN1(net64),
    .IN2(\u_pwm.u_pwm_core.duty_active [15]),
    .VDD(VDD));
 ADNR01 _1065_ (.A(net65),
    .B(\u_pwm.u_pwm_core.duty_active [14]),
    .C(_0437_),
    .OUT1(_0439_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1066_ (.A(net64),
    .B(\u_pwm.u_pwm_core.duty_active [15]),
    .C(net372),
    .OUT1(_0440_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1067_ (.A(_0438_),
    .B(_0439_),
    .C(_0440_),
    .OUT1(\u_pwm.u_pwm_core.pwm_next [1]),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1068_ (.OUT1(_0441_),
    .VSS(VSS),
    .IN1(_0246_),
    .IN2(\u_pwm.u_pwm_core.duty_active [18]),
    .VDD(VDD));
 AOI401 _1069_ (.A(_0243_),
    .B(\u_pwm.u_pwm_core.duty_active [17]),
    .C(\u_pwm.u_pwm_core.duty_active [16]),
    .D(net70),
    .OUT1(_0442_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1070_ (.OUT1(_0443_),
    .VSS(VSS),
    .IN1(_0243_),
    .IN2(\u_pwm.u_pwm_core.duty_active [17]),
    .VDD(VDD));
 NOR300 _1071_ (.OUT1(_0444_),
    .VSS(VSS),
    .IN1(_0441_),
    .IN2(_0442_),
    .IN3(_0443_),
    .VDD(VDD));
 ADNR01 _1072_ (.A(_0246_),
    .B(\u_pwm.u_pwm_core.duty_active [18]),
    .C(_0444_),
    .OUT1(_0445_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1073_ (.A(net74),
    .B(_0252_),
    .C(_0445_),
    .OUT1(_0446_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1074_ (.OUT1(_0447_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(\u_pwm.u_pwm_core.duty_active [20]),
    .VDD(VDD));
 ADNR01 _1075_ (.A(net74),
    .B(_0252_),
    .C(_0447_),
    .OUT1(_0448_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1076_ (.OUT1(_0449_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(net410),
    .VDD(VDD));
 NND201 _1077_ (.OUT1(_0450_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(\u_pwm.u_pwm_core.duty_active [20]),
    .VDD(VDD));
 NND201 _1078_ (.OUT1(_0451_),
    .VSS(VSS),
    .IN1(_0449_),
    .IN2(_0450_),
    .VDD(VDD));
 ADNR01 _1079_ (.A(_0446_),
    .B(_0448_),
    .C(_0451_),
    .OUT1(_0452_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1080_ (.OUT1(_0453_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(\u_pwm.u_pwm_core.duty_active [21]),
    .VDD(VDD));
 NOR200 _1081_ (.OUT1(_0454_),
    .VSS(VSS),
    .IN1(net65),
    .IN2(\u_pwm.u_pwm_core.duty_active [22]),
    .VDD(VDD));
 NOR300 _1082_ (.OUT1(_0455_),
    .VSS(VSS),
    .IN1(_0452_),
    .IN2(_0453_),
    .IN3(_0454_),
    .VDD(VDD));
 NND201 _1083_ (.OUT1(_0456_),
    .VSS(VSS),
    .IN1(net64),
    .IN2(\u_pwm.u_pwm_core.duty_active [23]),
    .VDD(VDD));
 ADNR01 _1084_ (.A(net65),
    .B(\u_pwm.u_pwm_core.duty_active [22]),
    .C(_0455_),
    .OUT1(_0457_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1085_ (.A(net64),
    .B(\u_pwm.u_pwm_core.duty_active [23]),
    .C(net372),
    .OUT1(_0458_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1086_ (.A(_0456_),
    .B(_0457_),
    .C(_0458_),
    .OUT1(\u_pwm.u_pwm_core.pwm_next [2]),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1087_ (.OUT1(_0459_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [26]),
    .VDD(VDD));
 NOR200 _1088_ (.OUT1(_0460_),
    .VSS(VSS),
    .IN1(net71),
    .IN2(\u_pwm.u_pwm_core.duty_active [25]),
    .VDD(VDD));
 AOI401 _1089_ (.A(net71),
    .B(\u_pwm.u_pwm_core.duty_active [25]),
    .C(\u_pwm.u_pwm_core.duty_active [24]),
    .D(net70),
    .OUT1(_0461_),
    .VSS(VSS),
    .VDD(VDD));
 NOR300 _1090_ (.OUT1(_0462_),
    .VSS(VSS),
    .IN1(_0459_),
    .IN2(_0460_),
    .IN3(_0461_),
    .VDD(VDD));
 NND201 _1091_ (.OUT1(_0463_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [26]),
    .VDD(VDD));
 NND201 _1092_ (.OUT1(_0464_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(\u_pwm.u_pwm_core.duty_active [27]),
    .VDD(VDD));
 NND201 _1093_ (.OUT1(_0465_),
    .VSS(VSS),
    .IN1(_0463_),
    .IN2(_0464_),
    .VDD(VDD));
 NOR200 _1094_ (.OUT1(_0466_),
    .VSS(VSS),
    .IN1(_0462_),
    .IN2(_0465_),
    .VDD(VDD));
 NOR200 _1095_ (.OUT1(_0467_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(net404),
    .VDD(VDD));
 NOR200 _1096_ (.OUT1(_0468_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(\u_pwm.u_pwm_core.duty_active [27]),
    .VDD(VDD));
 NOR300 _1097_ (.OUT1(_0469_),
    .VSS(VSS),
    .IN1(_0466_),
    .IN2(_0467_),
    .IN3(_0468_),
    .VDD(VDD));
 NND201 _1098_ (.OUT1(_0470_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(\u_pwm.u_pwm_core.duty_active [29]),
    .VDD(VDD));
 NND201 _1099_ (.OUT1(_0471_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(\u_pwm.u_pwm_core.duty_active [28]),
    .VDD(VDD));
 NND201 _1100_ (.OUT1(_0472_),
    .VSS(VSS),
    .IN1(_0470_),
    .IN2(_0471_),
    .VDD(VDD));
 NOR200 _1101_ (.OUT1(_0473_),
    .VSS(VSS),
    .IN1(_0469_),
    .IN2(_0472_),
    .VDD(VDD));
 NOR200 _1102_ (.OUT1(_0474_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(\u_pwm.u_pwm_core.duty_active [29]),
    .VDD(VDD));
 NOR200 _1103_ (.OUT1(_0475_),
    .VSS(VSS),
    .IN1(net65),
    .IN2(\u_pwm.u_pwm_core.duty_active [30]),
    .VDD(VDD));
 NOR300 _1104_ (.OUT1(_0476_),
    .VSS(VSS),
    .IN1(_0473_),
    .IN2(_0474_),
    .IN3(_0475_),
    .VDD(VDD));
 NND201 _1105_ (.OUT1(_0477_),
    .VSS(VSS),
    .IN1(net64),
    .IN2(\u_pwm.u_pwm_core.duty_active [31]),
    .VDD(VDD));
 ADNR01 _1106_ (.A(net65),
    .B(\u_pwm.u_pwm_core.duty_active [30]),
    .C(_0476_),
    .OUT1(_0478_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1107_ (.A(net64),
    .B(\u_pwm.u_pwm_core.duty_active [31]),
    .C(net372),
    .OUT1(_0479_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1108_ (.A(_0477_),
    .B(_0478_),
    .C(_0479_),
    .OUT1(\u_pwm.u_pwm_core.pwm_next [3]),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1109_ (.OUT1(_0480_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(net398),
    .VDD(VDD));
 NOR200 _1110_ (.OUT1(_0481_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(net399),
    .VDD(VDD));
 NND201 _1111_ (.OUT1(_0482_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [34]),
    .VDD(VDD));
 AOI401 _1112_ (.A(net71),
    .B(\u_pwm.u_pwm_core.duty_active [33]),
    .C(\u_pwm.u_pwm_core.duty_active [32]),
    .D(net70),
    .OUT1(_0483_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1113_ (.OUT1(_0484_),
    .VSS(VSS),
    .IN1(net71),
    .IN2(\u_pwm.u_pwm_core.duty_active [33]),
    .VDD(VDD));
 NND201 _1114_ (.OUT1(_0485_),
    .VSS(VSS),
    .IN1(_0480_),
    .IN2(_0482_),
    .VDD(VDD));
 NOR300 _1115_ (.OUT1(_0486_),
    .VSS(VSS),
    .IN1(_0481_),
    .IN2(_0483_),
    .IN3(_0484_),
    .VDD(VDD));
 NOR200 _1116_ (.OUT1(_0487_),
    .VSS(VSS),
    .IN1(_0485_),
    .IN2(_0486_),
    .VDD(VDD));
 NOR200 _1117_ (.OUT1(_0488_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(\u_pwm.u_pwm_core.duty_active [35]),
    .VDD(VDD));
 NOR200 _1118_ (.OUT1(_0489_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(net397),
    .VDD(VDD));
 NOR300 _1119_ (.OUT1(_0490_),
    .VSS(VSS),
    .IN1(_0487_),
    .IN2(_0488_),
    .IN3(_0489_),
    .VDD(VDD));
 NND201 _1120_ (.OUT1(_0491_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(\u_pwm.u_pwm_core.duty_active [37]),
    .VDD(VDD));
 NND201 _1121_ (.OUT1(_0492_),
    .VSS(VSS),
    .IN1(_0248_),
    .IN2(\u_pwm.u_pwm_core.duty_active [36]),
    .VDD(VDD));
 NND201 _1122_ (.OUT1(_0493_),
    .VSS(VSS),
    .IN1(_0491_),
    .IN2(_0492_),
    .VDD(VDD));
 NOR200 _1123_ (.OUT1(_0494_),
    .VSS(VSS),
    .IN1(_0490_),
    .IN2(_0493_),
    .VDD(VDD));
 NOR200 _1124_ (.OUT1(_0495_),
    .VSS(VSS),
    .IN1(_0249_),
    .IN2(\u_pwm.u_pwm_core.duty_active [38]),
    .VDD(VDD));
 NOR200 _1125_ (.OUT1(_0496_),
    .VSS(VSS),
    .IN1(net67),
    .IN2(\u_pwm.u_pwm_core.duty_active [37]),
    .VDD(VDD));
 NOR300 _1126_ (.OUT1(_0497_),
    .VSS(VSS),
    .IN1(_0494_),
    .IN2(_0495_),
    .IN3(_0496_),
    .VDD(VDD));
 NND201 _1127_ (.OUT1(_0498_),
    .VSS(VSS),
    .IN1(net64),
    .IN2(\u_pwm.u_pwm_core.duty_active [39]),
    .VDD(VDD));
 ADNR01 _1128_ (.A(_0249_),
    .B(\u_pwm.u_pwm_core.duty_active [38]),
    .C(_0497_),
    .OUT1(_0499_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1129_ (.A(net64),
    .B(\u_pwm.u_pwm_core.duty_active [39]),
    .C(net374),
    .OUT1(_0500_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1130_ (.A(_0498_),
    .B(_0499_),
    .C(_0500_),
    .OUT1(\u_pwm.u_pwm_core.pwm_next [4]),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1131_ (.OUT1(_0501_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [42]),
    .VDD(VDD));
 NOR200 _1132_ (.OUT1(_0502_),
    .VSS(VSS),
    .IN1(net71),
    .IN2(\u_pwm.u_pwm_core.duty_active [41]),
    .VDD(VDD));
 AOI401 _1133_ (.A(net71),
    .B(\u_pwm.u_pwm_core.duty_active [41]),
    .C(\u_pwm.u_pwm_core.duty_active [40]),
    .D(net70),
    .OUT1(_0503_),
    .VSS(VSS),
    .VDD(VDD));
 NOR300 _1134_ (.OUT1(_0504_),
    .VSS(VSS),
    .IN1(_0501_),
    .IN2(_0502_),
    .IN3(_0503_),
    .VDD(VDD));
 NND201 _1135_ (.OUT1(_0505_),
    .VSS(VSS),
    .IN1(net68),
    .IN2(\u_pwm.u_pwm_core.duty_active [42]),
    .VDD(VDD));
 NND201 _1136_ (.OUT1(_0506_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(\u_pwm.u_pwm_core.duty_active [43]),
    .VDD(VDD));
 NND201 _1137_ (.OUT1(_0507_),
    .VSS(VSS),
    .IN1(_0505_),
    .IN2(_0506_),
    .VDD(VDD));
 NOR200 _1138_ (.OUT1(_0508_),
    .VSS(VSS),
    .IN1(_0504_),
    .IN2(_0507_),
    .VDD(VDD));
 NOR200 _1139_ (.OUT1(_0509_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(\u_pwm.u_pwm_core.duty_active [44]),
    .VDD(VDD));
 NOR200 _1140_ (.OUT1(_0510_),
    .VSS(VSS),
    .IN1(net69),
    .IN2(\u_pwm.u_pwm_core.duty_active [43]),
    .VDD(VDD));
 NOR300 _1141_ (.OUT1(_0511_),
    .VSS(VSS),
    .IN1(_0508_),
    .IN2(_0509_),
    .IN3(_0510_),
    .VDD(VDD));
 NND201 _1142_ (.OUT1(_0512_),
    .VSS(VSS),
    .IN1(_0247_),
    .IN2(\u_pwm.u_pwm_core.duty_active [45]),
    .VDD(VDD));
 NND201 _1143_ (.OUT1(_0513_),
    .VSS(VSS),
    .IN1(net66),
    .IN2(\u_pwm.u_pwm_core.duty_active [44]),
    .VDD(VDD));
 NND201 _1144_ (.OUT1(_0514_),
    .VSS(VSS),
    .IN1(_0512_),
    .IN2(_0513_),
    .VDD(VDD));
 NOR200 _1145_ (.OUT1(_0515_),
    .VSS(VSS),
    .IN1(_0247_),
    .IN2(\u_pwm.u_pwm_core.duty_active [45]),
    .VDD(VDD));
 ADNR01 _1146_ (.A(net73),
    .B(_0253_),
    .C(_0515_),
    .OUT1(_0516_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1147_ (.A(_0511_),
    .B(_0514_),
    .C(_0516_),
    .OUT1(_0517_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1148_ (.OUT1(_0518_),
    .VSS(VSS),
    .IN1(net73),
    .IN2(_0253_),
    .VDD(VDD));
 ADNR01 _1149_ (.A(_0250_),
    .B(\u_pwm.u_pwm_core.duty_active [47]),
    .C(_0518_),
    .OUT1(_0519_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1150_ (.A(_0250_),
    .B(\u_pwm.u_pwm_core.duty_active [47]),
    .C(net374),
    .OUT1(_0520_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1151_ (.A(_0517_),
    .B(_0519_),
    .C(_0520_),
    .OUT1(\u_pwm.u_pwm_core.pwm_next [5]),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1152_ (.OUT1(_0521_),
    .VSS(VSS),
    .IN1(_0250_),
    .IN2(\u_pwm.u_pwm_core.duty_active [55]),
    .VDD(VDD));
 NOR200 _1153_ (.OUT1(_0522_),
    .VSS(VSS),
    .IN1(_0245_),
    .IN2(\u_pwm.u_pwm_core.duty_active [51]),
    .VDD(VDD));
 NOR200 _1154_ (.OUT1(_0523_),
    .VSS(VSS),
    .IN1(_0246_),
    .IN2(net386),
    .VDD(VDD));
 NND201 _1155_ (.OUT1(_0524_),
    .VSS(VSS),
    .IN1(_0244_),
    .IN2(net387),
    .VDD(VDD));
 ORND01 _1156_ (.A(\u_pwm.u_pwm_core.phase [1]),
    .B(_0254_),
    .C(_0524_),
    .OUT1(_0525_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1157_ (.A(\u_pwm.u_pwm_core.phase [1]),
    .B(_0254_),
    .C(_0523_),
    .OUT1(_0526_),
    .VSS(VSS),
    .VDD(VDD));
 AOI401 _1158_ (.A(_0246_),
    .B(net386),
    .C(_0525_),
    .D(_0526_),
    .OUT1(_0527_),
    .VSS(VSS),
    .VDD(VDD));
 AOI401 _1159_ (.A(_0248_),
    .B(net385),
    .C(\u_pwm.u_pwm_core.duty_active [51]),
    .D(_0245_),
    .OUT1(_0528_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1160_ (.A(_0522_),
    .B(_0527_),
    .C(_0528_),
    .OUT1(_0529_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1161_ (.OUT1(_0530_),
    .VSS(VSS),
    .IN1(_0248_),
    .IN2(\u_pwm.u_pwm_core.duty_active [52]),
    .VDD(VDD));
 ORND01 _1162_ (.A(_0247_),
    .B(\u_pwm.u_pwm_core.duty_active [53]),
    .C(_0529_),
    .OUT1(_0531_),
    .VSS(VSS),
    .VDD(VDD));
 AOI401 _1163_ (.A(_0249_),
    .B(\u_pwm.u_pwm_core.duty_active [54]),
    .C(\u_pwm.u_pwm_core.duty_active [53]),
    .D(_0247_),
    .OUT1(_0532_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1164_ (.A(_0530_),
    .B(_0531_),
    .C(_0532_),
    .OUT1(_0533_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1165_ (.A(_0249_),
    .B(\u_pwm.u_pwm_core.duty_active [54]),
    .C(_0533_),
    .OUT1(_0534_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1166_ (.A(_0250_),
    .B(\u_pwm.u_pwm_core.duty_active [55]),
    .C(net374),
    .OUT1(_0535_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1167_ (.A(_0521_),
    .B(_0534_),
    .C(_0535_),
    .OUT1(\u_pwm.u_pwm_core.pwm_next [6]),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1168_ (.OUT1(_0536_),
    .VSS(VSS),
    .IN1(_0246_),
    .IN2(\u_pwm.u_pwm_core.duty_active [58]),
    .VDD(VDD));
 NOR200 _1169_ (.OUT1(_0537_),
    .VSS(VSS),
    .IN1(_0243_),
    .IN2(\u_pwm.u_pwm_core.duty_active [57]),
    .VDD(VDD));
 AOI401 _1170_ (.A(_0243_),
    .B(\u_pwm.u_pwm_core.duty_active [57]),
    .C(\u_pwm.u_pwm_core.duty_active [56]),
    .D(_0244_),
    .OUT1(_0538_),
    .VSS(VSS),
    .VDD(VDD));
 NOR300 _1171_ (.OUT1(_0539_),
    .VSS(VSS),
    .IN1(_0536_),
    .IN2(_0537_),
    .IN3(_0538_),
    .VDD(VDD));
 NND201 _1172_ (.OUT1(_0540_),
    .VSS(VSS),
    .IN1(_0246_),
    .IN2(\u_pwm.u_pwm_core.duty_active [58]),
    .VDD(VDD));
 NND201 _1173_ (.OUT1(_0541_),
    .VSS(VSS),
    .IN1(_0245_),
    .IN2(net380),
    .VDD(VDD));
 NND201 _1174_ (.OUT1(_0542_),
    .VSS(VSS),
    .IN1(_0540_),
    .IN2(_0541_),
    .VDD(VDD));
 NOR200 _1175_ (.OUT1(_0543_),
    .VSS(VSS),
    .IN1(_0539_),
    .IN2(_0542_),
    .VDD(VDD));
 NOR200 _1176_ (.OUT1(_0544_),
    .VSS(VSS),
    .IN1(_0248_),
    .IN2(\u_pwm.u_pwm_core.duty_active [60]),
    .VDD(VDD));
 NOR200 _1177_ (.OUT1(_0545_),
    .VSS(VSS),
    .IN1(_0245_),
    .IN2(\u_pwm.u_pwm_core.duty_active [59]),
    .VDD(VDD));
 NOR300 _1178_ (.OUT1(_0546_),
    .VSS(VSS),
    .IN1(_0543_),
    .IN2(_0544_),
    .IN3(_0545_),
    .VDD(VDD));
 NND201 _1179_ (.OUT1(_0547_),
    .VSS(VSS),
    .IN1(_0247_),
    .IN2(\u_pwm.u_pwm_core.duty_active [61]),
    .VDD(VDD));
 NND201 _1180_ (.OUT1(_0548_),
    .VSS(VSS),
    .IN1(_0248_),
    .IN2(\u_pwm.u_pwm_core.duty_active [60]),
    .VDD(VDD));
 NND201 _1181_ (.OUT1(_0549_),
    .VSS(VSS),
    .IN1(_0547_),
    .IN2(_0548_),
    .VDD(VDD));
 NOR200 _1182_ (.OUT1(_0550_),
    .VSS(VSS),
    .IN1(_0247_),
    .IN2(\u_pwm.u_pwm_core.duty_active [61]),
    .VDD(VDD));
 ADNR01 _1183_ (.A(net73),
    .B(_0255_),
    .C(_0550_),
    .OUT1(_0551_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1184_ (.A(_0546_),
    .B(_0549_),
    .C(_0551_),
    .OUT1(_0552_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1185_ (.OUT1(_0553_),
    .VSS(VSS),
    .IN1(net73),
    .IN2(_0255_),
    .VDD(VDD));
 ADNR01 _1186_ (.A(_0250_),
    .B(\u_pwm.u_pwm_core.duty_active [63]),
    .C(_0553_),
    .OUT1(_0554_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1187_ (.A(_0250_),
    .B(\u_pwm.u_pwm_core.duty_active [63]),
    .C(net374),
    .OUT1(_0555_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1188_ (.A(_0552_),
    .B(_0554_),
    .C(_0555_),
    .OUT1(\u_pwm.u_pwm_core.pwm_next [7]),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1189_ (.OUT1(_0556_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [7]),
    .IN2(_0234_),
    .VDD(VDD));
 NND201 _1190_ (.OUT1(_0557_),
    .VSS(VSS),
    .IN1(_0235_),
    .IN2(\u_pwm.prescaler [6]),
    .VDD(VDD));
 NND201 _1191_ (.OUT1(_0558_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [5]),
    .IN2(_0236_),
    .VDD(VDD));
 NOR200 _1192_ (.OUT1(_0559_),
    .VSS(VSS),
    .IN1(_0240_),
    .IN2(\u_pwm.prescaler [1]),
    .VDD(VDD));
 NND201 _1193_ (.OUT1(_0560_),
    .VSS(VSS),
    .IN1(_0238_),
    .IN2(\u_pwm.prescaler [3]),
    .VDD(VDD));
 NOR200 _1194_ (.OUT1(_0561_),
    .VSS(VSS),
    .IN1(_0239_),
    .IN2(\u_pwm.prescaler [2]),
    .VDD(VDD));
 AOI401 _1195_ (.A(_0240_),
    .B(\u_pwm.prescaler [1]),
    .C(_0241_),
    .D(\u_pwm.prescaler [0]),
    .OUT1(_0562_),
    .VSS(VSS),
    .VDD(VDD));
 XOR201 _1196_ (.OUT1(_0563_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [2]),
    .IN2(\u_pwm.prescaler [2]),
    .VDD(VDD));
 ADNR01 _1197_ (.A(_0238_),
    .B(\u_pwm.prescaler [3]),
    .C(_0563_),
    .OUT1(_0564_),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1198_ (.A(_0559_),
    .B(_0562_),
    .C(_0564_),
    .OUT1(_0565_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1199_ (.OUT1(_0566_),
    .VSS(VSS),
    .IN1(_0238_),
    .IN2(\u_pwm.prescaler [3]),
    .VDD(VDD));
 NND201 _1200_ (.OUT1(_0567_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [4]),
    .IN2(_0237_),
    .VDD(VDD));
 ADNR01 _1201_ (.A(_0560_),
    .B(_0561_),
    .C(_0566_),
    .OUT1(_0568_),
    .VSS(VSS),
    .VDD(VDD));
 AND301 _1202_ (.OUT1(_0569_),
    .VSS(VSS),
    .IN1(_0565_),
    .IN2(_0567_),
    .IN3(_0568_),
    .VDD(VDD));
 NOR200 _1203_ (.OUT1(_0570_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [5]),
    .IN2(_0236_),
    .VDD(VDD));
 NOR200 _1204_ (.OUT1(_0571_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [4]),
    .IN2(_0237_),
    .VDD(VDD));
 OR2101 _1205_ (.OUT1(_0572_),
    .VSS(VSS),
    .IN1(_0570_),
    .IN2(_0571_),
    .VDD(VDD));
 ORND01 _1206_ (.A(_0569_),
    .B(_0572_),
    .C(_0558_),
    .OUT1(_0573_),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1207_ (.OUT1(_0574_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [7]),
    .IN2(_0234_),
    .VDD(VDD));
 ORND01 _1208_ (.A(_0235_),
    .B(\u_pwm.prescaler [6]),
    .C(_0574_),
    .OUT1(_0575_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1209_ (.A(_0557_),
    .B(_0573_),
    .C(_0575_),
    .OUT1(_0576_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1210_ (.OUT1(_0577_),
    .VSS(VSS),
    .IN1(_0556_),
    .IN2(_0576_),
    .VDD(VDD));
 OR2101 _1211_ (.OUT1(_0578_),
    .VSS(VSS),
    .IN1(net72),
    .IN2(_0577_),
    .VDD(VDD));
 NOR200 _1212_ (.OUT1(_0000_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [0]),
    .IN2(_0578_),
    .VDD(VDD));
 NOR200 _1213_ (.OUT1(_0579_),
    .VSS(VSS),
    .IN1(_0240_),
    .IN2(_0241_),
    .VDD(VDD));
 NOR200 _1214_ (.OUT1(_0580_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [1]),
    .IN2(\u_pwm.u_pwm_core.prescale_count [0]),
    .VDD(VDD));
 NOR300 _1215_ (.OUT1(_0001_),
    .VSS(VSS),
    .IN1(_0578_),
    .IN2(_0579_),
    .IN3(_0580_),
    .VDD(VDD));
 NOR300 _1216_ (.OUT1(_0581_),
    .VSS(VSS),
    .IN1(_0239_),
    .IN2(_0240_),
    .IN3(_0241_),
    .VDD(VDD));
 NOR200 _1217_ (.OUT1(_0582_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [2]),
    .IN2(_0579_),
    .VDD(VDD));
 NOR300 _1218_ (.OUT1(_0002_),
    .VSS(VSS),
    .IN1(_0578_),
    .IN2(_0581_),
    .IN3(_0582_),
    .VDD(VDD));
 AND201 _1219_ (.OUT1(_0583_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [3]),
    .IN2(_0581_),
    .VDD(VDD));
 NOR200 _1220_ (.OUT1(_0584_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [3]),
    .IN2(_0581_),
    .VDD(VDD));
 NOR300 _1221_ (.OUT1(_0003_),
    .VSS(VSS),
    .IN1(_0578_),
    .IN2(_0583_),
    .IN3(_0584_),
    .VDD(VDD));
 AND201 _1222_ (.OUT1(_0585_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [4]),
    .IN2(_0583_),
    .VDD(VDD));
 NOR200 _1223_ (.OUT1(_0586_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [4]),
    .IN2(_0583_),
    .VDD(VDD));
 NOR300 _1224_ (.OUT1(_0004_),
    .VSS(VSS),
    .IN1(_0578_),
    .IN2(_0585_),
    .IN3(_0586_),
    .VDD(VDD));
 AND201 _1225_ (.OUT1(_0587_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [5]),
    .IN2(_0585_),
    .VDD(VDD));
 NOR200 _1226_ (.OUT1(_0588_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [5]),
    .IN2(_0585_),
    .VDD(VDD));
 NOR300 _1227_ (.OUT1(_0005_),
    .VSS(VSS),
    .IN1(_0578_),
    .IN2(_0587_),
    .IN3(_0588_),
    .VDD(VDD));
 AND201 _1228_ (.OUT1(_0589_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [6]),
    .IN2(_0587_),
    .VDD(VDD));
 NOR200 _1229_ (.OUT1(_0590_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [6]),
    .IN2(_0587_),
    .VDD(VDD));
 NOR300 _1230_ (.OUT1(_0006_),
    .VSS(VSS),
    .IN1(_0578_),
    .IN2(_0589_),
    .IN3(_0590_),
    .VDD(VDD));
 XNR201 _1231_ (.OUT1(_0591_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.prescale_count [7]),
    .IN2(_0589_),
    .VDD(VDD));
 NOR200 _1232_ (.OUT1(_0007_),
    .VSS(VSS),
    .IN1(_0578_),
    .IN2(_0591_),
    .VDD(VDD));
 AND201 _1233_ (.OUT1(_0592_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.bit_cnt [0]),
    .IN2(\u_pwm.u_spi.bit_cnt [1]),
    .VDD(VDD));
 NOR200 _1234_ (.OUT1(_0629_[1]),
    .VSS(VSS),
    .IN1(_0260_),
    .IN2(_0592_),
    .VDD(VDD));
 NND201 _1235_ (.OUT1(_0593_),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.bit_cnt [2]),
    .IN2(_0592_),
    .VDD(VDD));
 XOR201 _1236_ (.OUT1(_0629_[2]),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.bit_cnt [2]),
    .IN2(_0592_),
    .VDD(VDD));
 XNR201 _1237_ (.OUT1(_0629_[3]),
    .VSS(VSS),
    .IN1(\u_pwm.u_spi.bit_cnt [3]),
    .IN2(_0593_),
    .VDD(VDD));
 AND201 _1238_ (.OUT1(_0008_),
    .VSS(VSS),
    .IN1(\u_pwm.pwm_en ),
    .IN2(\u_pwm.u_pwm_core.wrap ),
    .VDD(VDD));
 NND201 _1239_ (.OUT1(_0594_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [1]),
    .IN2(\u_pwm.u_pwm_core.phase [0]),
    .VDD(VDD));
 NND201 _1240_ (.OUT1(_0595_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [3]),
    .IN2(\u_pwm.u_pwm_core.phase [2]),
    .VDD(VDD));
 NOR300 _1241_ (.OUT1(_0596_),
    .VSS(VSS),
    .IN1(_0244_),
    .IN2(_0556_),
    .IN3(_0576_),
    .VDD(VDD));
 NOR301 _1242_ (.OUT1(_0597_),
    .VSS(VSS),
    .IN1(_0556_),
    .IN2(_0576_),
    .IN3(_0594_),
    .VDD(VDD));
 AND301 _1243_ (.OUT1(_0598_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [3]),
    .IN2(\u_pwm.u_pwm_core.phase [2]),
    .IN3(_0597_),
    .VDD(VDD));
 NOR501 _1244_ (.OUT1(_0599_),
    .VSS(VSS),
    .IN1(_0248_),
    .IN2(_0556_),
    .IN3(_0576_),
    .IN4(_0594_),
    .IN5(_0595_),
    .VDD(VDD));
 AND201 _1245_ (.OUT1(_0600_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [5]),
    .IN2(_0599_),
    .VDD(VDD));
 AND301 _1246_ (.OUT1(_0011_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [5]),
    .IN2(\u_pwm.u_pwm_core.phase [6]),
    .IN3(_0599_),
    .VDD(VDD));
 INVR01 _1247_ (.OUT1(_0601_),
    .VSS(VSS),
    .IN1(_0011_),
    .VDD(VDD));
 NOR300 _1248_ (.OUT1(_0009_),
    .VSS(VSS),
    .IN1(_0242_),
    .IN2(_0250_),
    .IN3(_0601_),
    .VDD(VDD));
 NOR200 _1249_ (.OUT1(_0602_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [1]),
    .IN2(\u_pwm.u_reg_bank.wr_addr [0]),
    .VDD(VDD));
 OR2101 _1250_ (.OUT1(_0603_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [5]),
    .IN2(\u_pwm.u_reg_bank.wr_addr [6]),
    .VDD(VDD));
 XNR201 _1251_ (.OUT1(_0604_),
    .VSS(VSS),
    .IN1(\u_pwm.wr_toggle_seen ),
    .IN2(\u_pwm.u_wr_toggle_sync.sync_ff2 ),
    .VDD(VDD));
 NOR301 _1252_ (.OUT1(_0605_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [4]),
    .IN2(_0603_),
    .IN3(_0604_),
    .VDD(VDD));
 INVR01 _1253_ (.OUT1(_0606_),
    .VSS(VSS),
    .IN1(_0605_),
    .VDD(VDD));
 NND201 _1254_ (.OUT1(_0607_),
    .VSS(VSS),
    .IN1(_0602_),
    .IN2(_0605_),
    .VDD(VDD));
 NND201 _1255_ (.OUT1(_0608_),
    .VSS(VSS),
    .IN1(_0233_),
    .IN2(\u_pwm.u_reg_bank.wr_addr [3]),
    .VDD(VDD));
 NOR200 _1256_ (.OUT1(_0609_),
    .VSS(VSS),
    .IN1(_0607_),
    .IN2(_0608_),
    .VDD(VDD));
 MX2101 _1257_ (.D0(net443),
    .OUT1(_0047_),
    .A0(_0609_),
    .D1(net228),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1258_ (.D0(net441),
    .OUT1(_0048_),
    .A0(net43),
    .D1(net216),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1259_ (.D0(net439),
    .OUT1(_0049_),
    .A0(net43),
    .D1(net206),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1260_ (.D0(net437),
    .OUT1(_0050_),
    .A0(net42),
    .D1(net191),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1261_ (.D0(net435),
    .OUT1(_0051_),
    .A0(net42),
    .D1(net177),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1262_ (.D0(net433),
    .OUT1(_0052_),
    .A0(net42),
    .D1(net160),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1263_ (.D0(net431),
    .OUT1(_0053_),
    .A0(net42),
    .D1(net144),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1264_ (.D0(net428),
    .OUT1(_0054_),
    .A0(net42),
    .D1(net130),
    .VSS(VSS),
    .VDD(VDD));
 ORND01 _1265_ (.A(_0250_),
    .B(_0601_),
    .C(net375),
    .OUT1(_0610_),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1266_ (.D0(\u_pwm.u_pwm_core.duty_active [0]),
    .OUT1(_0055_),
    .A0(net3),
    .D1(net337),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1267_ (.D0(net427),
    .OUT1(_0056_),
    .A0(net3),
    .D1(net335),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1268_ (.D0(net426),
    .OUT1(_0057_),
    .A0(net2),
    .D1(\u_pwm.duty [2]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1269_ (.D0(net425),
    .OUT1(_0058_),
    .A0(net9),
    .D1(net333),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1270_ (.D0(net424),
    .OUT1(_0059_),
    .A0(net9),
    .D1(net331),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1271_ (.D0(net423),
    .OUT1(_0060_),
    .A0(net10),
    .D1(net328),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1272_ (.D0(net422),
    .OUT1(_0061_),
    .A0(net10),
    .D1(net326),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1273_ (.D0(net421),
    .OUT1(_0062_),
    .A0(net10),
    .D1(net325),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1274_ (.D0(\u_pwm.u_pwm_core.duty_active [8]),
    .OUT1(_0063_),
    .A0(net2),
    .D1(\u_pwm.duty [8]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1275_ (.D0(net420),
    .OUT1(_0064_),
    .A0(net2),
    .D1(net322),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1276_ (.D0(net419),
    .OUT1(_0065_),
    .A0(net2),
    .D1(net320),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1277_ (.D0(net418),
    .OUT1(_0066_),
    .A0(net11),
    .D1(net317),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1278_ (.D0(net417),
    .OUT1(_0067_),
    .A0(net13),
    .D1(\u_pwm.duty [12]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1279_ (.D0(net416),
    .OUT1(_0068_),
    .A0(net12),
    .D1(net315),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1280_ (.D0(net415),
    .OUT1(_0069_),
    .A0(net10),
    .D1(net313),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1281_ (.D0(net414),
    .OUT1(_0070_),
    .A0(net12),
    .D1(net311),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1282_ (.D0(\u_pwm.u_pwm_core.duty_active [16]),
    .OUT1(_0071_),
    .A0(net3),
    .D1(net292),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1283_ (.D0(net413),
    .OUT1(_0072_),
    .A0(net6),
    .D1(net290),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1284_ (.D0(net412),
    .OUT1(_0073_),
    .A0(net5),
    .D1(net288),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1285_ (.D0(\u_pwm.u_pwm_core.duty_active [19]),
    .OUT1(_0074_),
    .A0(net8),
    .D1(net287),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1286_ (.D0(net411),
    .OUT1(_0075_),
    .A0(net15),
    .D1(\u_pwm.duty [20]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1287_ (.D0(net410),
    .OUT1(_0076_),
    .A0(net18),
    .D1(net284),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1288_ (.D0(net409),
    .OUT1(_0077_),
    .A0(net18),
    .D1(net282),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1289_ (.D0(net408),
    .OUT1(_0078_),
    .A0(net18),
    .D1(net280),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1290_ (.D0(\u_pwm.u_pwm_core.duty_active [24]),
    .OUT1(_0079_),
    .A0(net14),
    .D1(\u_pwm.duty [24]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1291_ (.D0(net407),
    .OUT1(_0080_),
    .A0(net14),
    .D1(\u_pwm.duty [25]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1292_ (.D0(net406),
    .OUT1(_0081_),
    .A0(net9),
    .D1(net349),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1293_ (.D0(net405),
    .OUT1(_0082_),
    .A0(net11),
    .D1(net347),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1294_ (.D0(net404),
    .OUT1(_0083_),
    .A0(net13),
    .D1(net345),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1295_ (.D0(net403),
    .OUT1(_0084_),
    .A0(net12),
    .D1(net343),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1296_ (.D0(net402),
    .OUT1(_0085_),
    .A0(net15),
    .D1(net342),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1297_ (.D0(net401),
    .OUT1(_0086_),
    .A0(net15),
    .D1(net340),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1298_ (.D0(\u_pwm.u_pwm_core.duty_active [32]),
    .OUT1(_0087_),
    .A0(net5),
    .D1(net308),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1299_ (.D0(net400),
    .OUT1(_0088_),
    .A0(net5),
    .D1(net307),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1300_ (.D0(net399),
    .OUT1(_0089_),
    .A0(net19),
    .D1(net305),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1301_ (.D0(net398),
    .OUT1(_0090_),
    .A0(net19),
    .D1(net303),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1302_ (.D0(net397),
    .OUT1(_0091_),
    .A0(net18),
    .D1(net301),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1303_ (.D0(net396),
    .OUT1(_0092_),
    .A0(net20),
    .D1(net299),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1304_ (.D0(net395),
    .OUT1(_0093_),
    .A0(net20),
    .D1(net297),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1305_ (.D0(net394),
    .OUT1(_0094_),
    .A0(net20),
    .D1(net295),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1306_ (.D0(\u_pwm.u_pwm_core.duty_active [40]),
    .OUT1(_0095_),
    .A0(net17),
    .D1(\u_pwm.duty [40]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1307_ (.D0(net393),
    .OUT1(_0096_),
    .A0(net17),
    .D1(\u_pwm.duty [41]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1308_ (.D0(net392),
    .OUT1(_0097_),
    .A0(net17),
    .D1(\u_pwm.duty [42]),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1309_ (.D0(net391),
    .OUT1(_0098_),
    .A0(net17),
    .D1(net368),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1310_ (.D0(net390),
    .OUT1(_0099_),
    .A0(net17),
    .D1(net365),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1311_ (.D0(net389),
    .OUT1(_0100_),
    .A0(net21),
    .D1(net363),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1312_ (.D0(\u_pwm.u_pwm_core.duty_active [46]),
    .OUT1(_0101_),
    .A0(net20),
    .D1(net362),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1313_ (.D0(net388),
    .OUT1(_0102_),
    .A0(net16),
    .D1(net360),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1314_ (.D0(net387),
    .OUT1(_0103_),
    .A0(net7),
    .D1(net442),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1315_ (.D0(\u_pwm.u_pwm_core.duty_active [49]),
    .OUT1(_0104_),
    .A0(net7),
    .D1(net440),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1316_ (.D0(net386),
    .OUT1(_0105_),
    .A0(net7),
    .D1(net438),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1317_ (.D0(\u_pwm.u_pwm_core.duty_active [51]),
    .OUT1(_0106_),
    .A0(net4),
    .D1(net436),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1318_ (.D0(net385),
    .OUT1(_0107_),
    .A0(net4),
    .D1(net434),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1319_ (.D0(net384),
    .OUT1(_0108_),
    .A0(net4),
    .D1(net432),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1320_ (.D0(net383),
    .OUT1(_0109_),
    .A0(net4),
    .D1(net430),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1321_ (.D0(net382),
    .OUT1(_0110_),
    .A0(net16),
    .D1(net429),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1322_ (.D0(\u_pwm.u_pwm_core.duty_active [56]),
    .OUT1(_0111_),
    .A0(net1),
    .D1(net277),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1323_ (.D0(\u_pwm.u_pwm_core.duty_active [57]),
    .OUT1(_0112_),
    .A0(net6),
    .D1(net275),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1324_ (.D0(net381),
    .OUT1(_0113_),
    .A0(net23),
    .D1(net273),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1325_ (.D0(net380),
    .OUT1(_0114_),
    .A0(net25),
    .D1(net271),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1326_ (.D0(net379),
    .OUT1(_0115_),
    .A0(net23),
    .D1(net269),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1327_ (.D0(net378),
    .OUT1(_0116_),
    .A0(net25),
    .D1(net267),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1328_ (.D0(\u_pwm.u_pwm_core.duty_active [62]),
    .OUT1(_0117_),
    .A0(net25),
    .D1(net266),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1329_ (.D0(net377),
    .OUT1(_0118_),
    .A0(net26),
    .D1(net263),
    .VSS(VSS),
    .VDD(VDD));
 NOR300 _1330_ (.OUT1(_0611_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [2]),
    .IN2(\u_pwm.u_reg_bank.wr_addr [3]),
    .IN3(_0607_),
    .VDD(VDD));
 MX2101 _1331_ (.D0(net373),
    .OUT1(_0119_),
    .A0(_0611_),
    .D1(net230),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1332_ (.OUT1(_0612_),
    .VSS(VSS),
    .IN1(_0233_),
    .IN2(\u_pwm.u_reg_bank.wr_addr [3]),
    .VDD(VDD));
 NND201 _1333_ (.OUT1(_0613_),
    .VSS(VSS),
    .IN1(_0605_),
    .IN2(_0612_),
    .VDD(VDD));
 NND201 _1334_ (.OUT1(_0614_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [1]),
    .IN2(\u_pwm.u_reg_bank.wr_addr [0]),
    .VDD(VDD));
 NOR200 _1335_ (.OUT1(_0615_),
    .VSS(VSS),
    .IN1(_0613_),
    .IN2(_0614_),
    .VDD(VDD));
 MX2101 _1336_ (.D0(net371),
    .OUT1(_0120_),
    .A0(net40),
    .D1(net237),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1337_ (.D0(net370),
    .OUT1(_0121_),
    .A0(net41),
    .D1(net220),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1338_ (.D0(net369),
    .OUT1(_0122_),
    .A0(net39),
    .D1(net201),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1339_ (.D0(net367),
    .OUT1(_0123_),
    .A0(net40),
    .D1(net195),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1340_ (.D0(net366),
    .OUT1(_0124_),
    .A0(net40),
    .D1(net181),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1341_ (.D0(net364),
    .OUT1(_0125_),
    .A0(net39),
    .D1(net161),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1342_ (.D0(net361),
    .OUT1(_0126_),
    .A0(net39),
    .D1(net145),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1343_ (.D0(net359),
    .OUT1(_0127_),
    .A0(net39),
    .D1(net131),
    .VSS(VSS),
    .VDD(VDD));
 NND201 _1344_ (.OUT1(_0616_),
    .VSS(VSS),
    .IN1(_0232_),
    .IN2(\u_pwm.u_reg_bank.wr_addr [0]),
    .VDD(VDD));
 NOR300 _1345_ (.OUT1(_0617_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [2]),
    .IN2(\u_pwm.u_reg_bank.wr_addr [3]),
    .IN3(_0616_),
    .VDD(VDD));
 NND201 _1346_ (.OUT1(_0618_),
    .VSS(VSS),
    .IN1(_0605_),
    .IN2(_0617_),
    .VDD(VDD));
 MX2101 _1347_ (.D0(net229),
    .OUT1(_0128_),
    .A0(_0618_),
    .D1(net358),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1348_ (.D0(net215),
    .OUT1(_0129_),
    .A0(_0618_),
    .D1(net357),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1349_ (.D0(net208),
    .OUT1(_0130_),
    .A0(_0618_),
    .D1(net356),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1350_ (.D0(net188),
    .OUT1(_0131_),
    .A0(net38),
    .D1(net355),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1351_ (.D0(net174),
    .OUT1(_0132_),
    .A0(net38),
    .D1(net354),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1352_ (.D0(net170),
    .OUT1(_0133_),
    .A0(net38),
    .D1(net353),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1353_ (.D0(net155),
    .OUT1(_0134_),
    .A0(net38),
    .D1(net352),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1354_ (.D0(net141),
    .OUT1(_0135_),
    .A0(net38),
    .D1(\u_pwm.prescaler [7]),
    .VSS(VSS),
    .VDD(VDD));
 NOR201 _1355_ (.OUT1(_0619_),
    .VSS(VSS),
    .IN1(_0613_),
    .IN2(_0616_),
    .VDD(VDD));
 MX2101 _1356_ (.D0(net351),
    .OUT1(_0136_),
    .A0(net36),
    .D1(net236),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1357_ (.D0(net350),
    .OUT1(_0137_),
    .A0(_0619_),
    .D1(net221),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1358_ (.D0(net348),
    .OUT1(_0138_),
    .A0(net37),
    .D1(net211),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1359_ (.D0(net346),
    .OUT1(_0139_),
    .A0(net37),
    .D1(net198),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1360_ (.D0(\u_pwm.duty [28]),
    .OUT1(_0140_),
    .A0(net36),
    .D1(net182),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1361_ (.D0(net344),
    .OUT1(_0141_),
    .A0(net37),
    .D1(net167),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1362_ (.D0(net341),
    .OUT1(_0142_),
    .A0(net36),
    .D1(net150),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1363_ (.D0(net339),
    .OUT1(_0143_),
    .A0(net36),
    .D1(net136),
    .VSS(VSS),
    .VDD(VDD));
 OR2101 _1364_ (.OUT1(_0620_),
    .VSS(VSS),
    .IN1(_0232_),
    .IN2(\u_pwm.u_reg_bank.wr_addr [0]),
    .VDD(VDD));
 NOR300 _1365_ (.OUT1(_0621_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [2]),
    .IN2(\u_pwm.u_reg_bank.wr_addr [3]),
    .IN3(_0620_),
    .VDD(VDD));
 NND201 _1366_ (.OUT1(_0622_),
    .VSS(VSS),
    .IN1(_0605_),
    .IN2(_0621_),
    .VDD(VDD));
 MX2101 _1367_ (.D0(net231),
    .OUT1(_0144_),
    .A0(_0622_),
    .D1(net338),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1368_ (.D0(net226),
    .OUT1(_0145_),
    .A0(_0622_),
    .D1(net336),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1369_ (.D0(net212),
    .OUT1(_0146_),
    .A0(net34),
    .D1(net334),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1370_ (.D0(net197),
    .OUT1(_0147_),
    .A0(net35),
    .D1(net332),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1371_ (.D0(net185),
    .OUT1(_0148_),
    .A0(net35),
    .D1(net330),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1372_ (.D0(net168),
    .OUT1(_0149_),
    .A0(net34),
    .D1(net329),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1373_ (.D0(net153),
    .OUT1(_0150_),
    .A0(net34),
    .D1(net327),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1374_ (.D0(net139),
    .OUT1(_0151_),
    .A0(net34),
    .D1(net324),
    .VSS(VSS),
    .VDD(VDD));
 NOR300 _1375_ (.OUT1(_0623_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [2]),
    .IN2(\u_pwm.u_reg_bank.wr_addr [3]),
    .IN3(_0614_),
    .VDD(VDD));
 NND201 _1376_ (.OUT1(_0624_),
    .VSS(VSS),
    .IN1(_0605_),
    .IN2(_0623_),
    .VDD(VDD));
 MX2101 _1377_ (.D0(net239),
    .OUT1(_0152_),
    .A0(net61),
    .D1(net323),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1378_ (.D0(net224),
    .OUT1(_0153_),
    .A0(_0624_),
    .D1(net321),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1379_ (.D0(net213),
    .OUT1(_0154_),
    .A0(net62),
    .D1(net319),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1380_ (.D0(net199),
    .OUT1(_0155_),
    .A0(net62),
    .D1(net318),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1381_ (.D0(net184),
    .OUT1(_0156_),
    .A0(net61),
    .D1(net316),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1382_ (.D0(net166),
    .OUT1(_0157_),
    .A0(net61),
    .D1(net314),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1383_ (.D0(net151),
    .OUT1(_0158_),
    .A0(net62),
    .D1(net312),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1384_ (.D0(net138),
    .OUT1(_0159_),
    .A0(net61),
    .D1(net310),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1385_ (.OUT1(_0625_),
    .VSS(VSS),
    .IN1(_0613_),
    .IN2(_0620_),
    .VDD(VDD));
 MX2101 _1386_ (.D0(net309),
    .OUT1(_0160_),
    .A0(net33),
    .D1(net235),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1387_ (.D0(net306),
    .OUT1(_0161_),
    .A0(net33),
    .D1(net219),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1388_ (.D0(net304),
    .OUT1(_0162_),
    .A0(net32),
    .D1(net202),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1389_ (.D0(net302),
    .OUT1(_0163_),
    .A0(net32),
    .D1(net192),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1390_ (.D0(net300),
    .OUT1(_0164_),
    .A0(net31),
    .D1(net178),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1391_ (.D0(net298),
    .OUT1(_0165_),
    .A0(net31),
    .D1(net163),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1392_ (.D0(net296),
    .OUT1(_0166_),
    .A0(net31),
    .D1(net146),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1393_ (.D0(net294),
    .OUT1(_0167_),
    .A0(net31),
    .D1(net133),
    .VSS(VSS),
    .VDD(VDD));
 NOR301 _1394_ (.OUT1(_0626_),
    .VSS(VSS),
    .IN1(\u_pwm.u_reg_bank.wr_addr [1]),
    .IN2(\u_pwm.u_reg_bank.wr_addr [0]),
    .IN3(_0613_),
    .VDD(VDD));
 MX2101 _1395_ (.D0(net293),
    .OUT1(_0168_),
    .A0(_0626_),
    .D1(net234),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1396_ (.D0(net291),
    .OUT1(_0169_),
    .A0(_0626_),
    .D1(net218),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1397_ (.D0(net289),
    .OUT1(_0170_),
    .A0(net30),
    .D1(net203),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1398_ (.D0(net286),
    .OUT1(_0171_),
    .A0(net30),
    .D1(net193),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1399_ (.D0(net285),
    .OUT1(_0172_),
    .A0(net29),
    .D1(net179),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1400_ (.D0(net283),
    .OUT1(_0173_),
    .A0(net29),
    .D1(net164),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1401_ (.D0(net281),
    .OUT1(_0174_),
    .A0(net29),
    .D1(net148),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1402_ (.D0(net279),
    .OUT1(_0175_),
    .A0(net29),
    .D1(net134),
    .VSS(VSS),
    .VDD(VDD));
 NOR300 _1403_ (.OUT1(_0627_),
    .VSS(VSS),
    .IN1(_0606_),
    .IN2(_0608_),
    .IN3(_0616_),
    .VDD(VDD));
 MX2101 _1404_ (.D0(net278),
    .OUT1(_0176_),
    .A0(net28),
    .D1(net233),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1405_ (.D0(net276),
    .OUT1(_0177_),
    .A0(net28),
    .D1(net217),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1406_ (.D0(net274),
    .OUT1(_0178_),
    .A0(net28),
    .D1(net204),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1407_ (.D0(net272),
    .OUT1(_0179_),
    .A0(net27),
    .D1(net190),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1408_ (.D0(net270),
    .OUT1(_0180_),
    .A0(net27),
    .D1(net173),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1409_ (.D0(net268),
    .OUT1(_0181_),
    .A0(net27),
    .D1(net159),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1410_ (.D0(net265),
    .OUT1(_0182_),
    .A0(net27),
    .D1(net154),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1411_ (.D0(net264),
    .OUT1(_0183_),
    .A0(net27),
    .D1(net129),
    .VSS(VSS),
    .VDD(VDD));
 NOR301 _1412_ (.OUT1(_0216_),
    .VSS(VSS),
    .IN1(net63),
    .IN2(\u_pwm.u_spi.shift_in [14]),
    .IN3(_0593_),
    .VDD(VDD));
 MX2101 _1413_ (.D0(net246),
    .OUT1(_0192_),
    .A0(net59),
    .D1(net253),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1414_ (.D0(net245),
    .OUT1(_0193_),
    .A0(net58),
    .D1(net252),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1415_ (.D0(net244),
    .OUT1(_0194_),
    .A0(net57),
    .D1(net251),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1416_ (.D0(net243),
    .OUT1(_0195_),
    .A0(net57),
    .D1(net250),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1417_ (.D0(\u_pwm.u_reg_bank.wr_addr [4]),
    .OUT1(_0196_),
    .A0(net59),
    .D1(net249),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1418_ (.D0(\u_pwm.u_reg_bank.wr_addr [5]),
    .OUT1(_0197_),
    .A0(net59),
    .D1(net248),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1419_ (.D0(\u_pwm.u_reg_bank.wr_addr [6]),
    .OUT1(_0198_),
    .A0(_0216_),
    .D1(net247),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1420_ (.D0(net242),
    .OUT1(_0199_),
    .A0(net60),
    .D1(mosi),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1421_ (.D0(net227),
    .OUT1(_0200_),
    .A0(net57),
    .D1(net261),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1422_ (.D0(net209),
    .OUT1(_0201_),
    .A0(net57),
    .D1(net259),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1423_ (.D0(net189),
    .OUT1(_0202_),
    .A0(net58),
    .D1(net258),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1424_ (.D0(net176),
    .OUT1(_0203_),
    .A0(net57),
    .D1(net257),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1425_ (.D0(net171),
    .OUT1(_0204_),
    .A0(net58),
    .D1(net256),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1426_ (.D0(net157),
    .OUT1(_0205_),
    .A0(net60),
    .D1(net255),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1427_ (.D0(net142),
    .OUT1(_0206_),
    .A0(net60),
    .D1(net254),
    .VSS(VSS),
    .VDD(VDD));
 MX2101 _1428_ (.D0(net75),
    .OUT1(_0207_),
    .A0(net59),
    .D1(_0010_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1429_ (.OUT1(_0217_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [0]),
    .IN2(_0577_),
    .VDD(VDD));
 NOR300 _1430_ (.OUT1(_0208_),
    .VSS(VSS),
    .IN1(net72),
    .IN2(_0596_),
    .IN3(_0217_),
    .VDD(VDD));
 NOR200 _1431_ (.OUT1(_0218_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [1]),
    .IN2(_0596_),
    .VDD(VDD));
 NOR300 _1432_ (.OUT1(_0209_),
    .VSS(VSS),
    .IN1(net72),
    .IN2(_0597_),
    .IN3(_0218_),
    .VDD(VDD));
 ORND01 _1433_ (.A(\u_pwm.u_pwm_core.phase [2]),
    .B(_0597_),
    .C(\u_pwm.pwm_en ),
    .OUT1(_0219_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1434_ (.A(\u_pwm.u_pwm_core.phase [2]),
    .B(_0597_),
    .C(_0219_),
    .OUT1(_0210_),
    .VSS(VSS),
    .VDD(VDD));
 ADNR01 _1435_ (.A(\u_pwm.u_pwm_core.phase [2]),
    .B(_0597_),
    .C(\u_pwm.u_pwm_core.phase [3]),
    .OUT1(_0220_),
    .VSS(VSS),
    .VDD(VDD));
 NOR300 _1436_ (.OUT1(_0211_),
    .VSS(VSS),
    .IN1(net72),
    .IN2(_0598_),
    .IN3(_0220_),
    .VDD(VDD));
 NOR200 _1437_ (.OUT1(_0221_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [4]),
    .IN2(_0598_),
    .VDD(VDD));
 NOR300 _1438_ (.OUT1(_0212_),
    .VSS(VSS),
    .IN1(net72),
    .IN2(_0599_),
    .IN3(_0221_),
    .VDD(VDD));
 NOR200 _1439_ (.OUT1(_0222_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [5]),
    .IN2(_0599_),
    .VDD(VDD));
 NOR300 _1440_ (.OUT1(_0213_),
    .VSS(VSS),
    .IN1(_0242_),
    .IN2(_0600_),
    .IN3(_0222_),
    .VDD(VDD));
 NOR200 _1441_ (.OUT1(_0223_),
    .VSS(VSS),
    .IN1(\u_pwm.u_pwm_core.phase [6]),
    .IN2(_0600_),
    .VDD(VDD));
 NND201 _1442_ (.OUT1(_0224_),
    .VSS(VSS),
    .IN1(net375),
    .IN2(_0601_),
    .VDD(VDD));
 NOR200 _1443_ (.OUT1(_0214_),
    .VSS(VSS),
    .IN1(_0223_),
    .IN2(_0224_),
    .VDD(VDD));
 ADNR01 _1444_ (.A(_0250_),
    .B(_0601_),
    .C(net22),
    .OUT1(_0215_),
    .VSS(VSS),
    .VDD(VDD));
 NOR200 _1445_ (.OUT1(_0039_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net447),
    .VDD(VDD));
 NOR200 _1446_ (.OUT1(_0037_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net447),
    .VDD(VDD));
 NOR200 _1447_ (.OUT1(_0035_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net447),
    .VDD(VDD));
 NOR200 _1448_ (.OUT1(_0033_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net447),
    .VDD(VDD));
 NOR200 _1449_ (.OUT1(_0031_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net447),
    .VDD(VDD));
 NOR200 _1450_ (.OUT1(_0029_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net448),
    .VDD(VDD));
 NOR200 _1451_ (.OUT1(_0027_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net448),
    .VDD(VDD));
 NOR200 _1452_ (.OUT1(_0012_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net446),
    .VDD(VDD));
 NOR200 _1453_ (.OUT1(_0013_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net445),
    .VDD(VDD));
 NOR200 _1454_ (.OUT1(_0014_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net445),
    .VDD(VDD));
 NOR200 _1455_ (.OUT1(_0015_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net446),
    .VDD(VDD));
 NOR200 _1456_ (.OUT1(_0016_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net446),
    .VDD(VDD));
 NOR200 _1457_ (.OUT1(_0017_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net446),
    .VDD(VDD));
 NOR200 _1458_ (.OUT1(_0018_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net446),
    .VDD(VDD));
 NOR200 _1459_ (.OUT1(_0019_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(_0231_),
    .VDD(VDD));
 NOR200 _1460_ (.OUT1(_0020_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net445),
    .VDD(VDD));
 NOR200 _1461_ (.OUT1(_0021_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net445),
    .VDD(VDD));
 NOR200 _1462_ (.OUT1(_0022_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net445),
    .VDD(VDD));
 NOR200 _1463_ (.OUT1(_0023_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net445),
    .VDD(VDD));
 NOR200 _1464_ (.OUT1(_0024_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net445),
    .VDD(VDD));
 NOR200 _1465_ (.OUT1(_0025_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net445),
    .VDD(VDD));
 NOR200 _1466_ (.OUT1(_0026_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net444),
    .VDD(VDD));
 INVR01 _1467_ (.OUT1(_0030_),
    .VSS(VSS),
    .IN1(clknet_2_2__leaf_sclk),
    .VDD(VDD));
 INVR01 _1468_ (.OUT1(_0032_),
    .VSS(VSS),
    .IN1(clknet_2_3__leaf_sclk),
    .VDD(VDD));
 INVR01 _1469_ (.OUT1(_0034_),
    .VSS(VSS),
    .IN1(clknet_2_2__leaf_sclk),
    .VDD(VDD));
 INVR01 _1470_ (.OUT1(_0036_),
    .VSS(VSS),
    .IN1(clknet_2_3__leaf_sclk),
    .VDD(VDD));
 INVR01 _1471_ (.OUT1(_0038_),
    .VSS(VSS),
    .IN1(clknet_2_3__leaf_sclk),
    .VDD(VDD));
 INVR01 _1472_ (.OUT1(_0040_),
    .VSS(VSS),
    .IN1(clknet_2_3__leaf_sclk),
    .VDD(VDD));
 INVR01 _1473_ (.OUT1(_0042_),
    .VSS(VSS),
    .IN1(clknet_2_2__leaf_sclk),
    .VDD(VDD));
 NOR200 _1474_ (.OUT1(_0043_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net448),
    .VDD(VDD));
 NOR200 _1475_ (.OUT1(_0044_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net448),
    .VDD(VDD));
 NOR200 _1476_ (.OUT1(_0045_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net448),
    .VDD(VDD));
 NOR200 _1477_ (.OUT1(_0046_),
    .VSS(VSS),
    .IN1(cs_n),
    .IN2(net448),
    .VDD(VDD));
 DFCL11 _1478_ (.Q(\u_pwm.duty [48]),
    .C(clknet_4_8_0_clk),
    .D(_0047_),
    .QB(_0816_),
    .VSS(VSS),
    .CLRB(net78),
    .VDD(VDD));
 DFCL11 _1479_ (.Q(\u_pwm.duty [49]),
    .C(clknet_4_8_0_clk),
    .D(_0048_),
    .QB(_0815_),
    .VSS(VSS),
    .CLRB(net95),
    .VDD(VDD));
 DFCL11 _1480_ (.Q(\u_pwm.duty [50]),
    .C(clknet_4_10_0_clk),
    .D(_0049_),
    .QB(_0814_),
    .VSS(VSS),
    .CLRB(net105),
    .VDD(VDD));
 DFCL11 _1481_ (.Q(\u_pwm.duty [51]),
    .C(clknet_4_14_0_clk),
    .D(_0050_),
    .QB(_0813_),
    .VSS(VSS),
    .CLRB(net112),
    .VDD(VDD));
 DFCL11 _1482_ (.Q(\u_pwm.duty [52]),
    .C(clknet_4_14_0_clk),
    .D(_0051_),
    .QB(_0812_),
    .VSS(VSS),
    .CLRB(net116),
    .VDD(VDD));
 DFCL11 _1483_ (.Q(\u_pwm.duty [53]),
    .C(clknet_4_11_0_clk),
    .D(_0052_),
    .QB(_0811_),
    .VSS(VSS),
    .CLRB(net101),
    .VDD(VDD));
 DFCL11 _1484_ (.Q(\u_pwm.duty [54]),
    .C(clknet_4_14_0_clk),
    .D(_0053_),
    .QB(_0810_),
    .VSS(VSS),
    .CLRB(net116),
    .VDD(VDD));
 DFCL11 _1485_ (.Q(\u_pwm.duty [55]),
    .C(clknet_4_14_0_clk),
    .D(_0054_),
    .QB(_0809_),
    .VSS(VSS),
    .CLRB(net116),
    .VDD(VDD));
 DFCL11 _1486_ (.Q(\u_pwm.u_pwm_core.duty_active [0]),
    .C(clknet_4_1_0_clk),
    .D(_0055_),
    .QB(_0808_),
    .VSS(VSS),
    .CLRB(net77),
    .VDD(VDD));
 DFCL11 _1487_ (.Q(\u_pwm.u_pwm_core.duty_active [1]),
    .C(clknet_4_3_0_clk),
    .D(_0056_),
    .QB(_0807_),
    .VSS(VSS),
    .CLRB(net77),
    .VDD(VDD));
 DFCL11 _1488_ (.Q(\u_pwm.u_pwm_core.duty_active [2]),
    .C(clknet_4_4_0_clk),
    .D(_0057_),
    .QB(_0806_),
    .VSS(VSS),
    .CLRB(net94),
    .VDD(VDD));
 DFCL11 _1489_ (.Q(\u_pwm.u_pwm_core.duty_active [3]),
    .C(clknet_4_6_0_clk),
    .D(_0058_),
    .QB(_0805_),
    .VSS(VSS),
    .CLRB(net88),
    .VDD(VDD));
 DFCL11 _1490_ (.Q(\u_pwm.u_pwm_core.duty_active [4]),
    .C(clknet_4_6_0_clk),
    .D(_0059_),
    .QB(_0804_),
    .VSS(VSS),
    .CLRB(net87),
    .VDD(VDD));
 DFCL11 _1491_ (.Q(\u_pwm.u_pwm_core.duty_active [5]),
    .C(clknet_4_4_0_clk),
    .D(_0060_),
    .QB(_0803_),
    .VSS(VSS),
    .CLRB(net92),
    .VDD(VDD));
 DFCL11 _1492_ (.Q(\u_pwm.u_pwm_core.duty_active [6]),
    .C(clknet_4_5_0_clk),
    .D(_0061_),
    .QB(_0802_),
    .VSS(VSS),
    .CLRB(net92),
    .VDD(VDD));
 DFCL11 _1493_ (.Q(\u_pwm.u_pwm_core.duty_active [7]),
    .C(clknet_4_5_0_clk),
    .D(_0062_),
    .QB(_0801_),
    .VSS(VSS),
    .CLRB(net90),
    .VDD(VDD));
 DFCL11 _1494_ (.Q(\u_pwm.u_pwm_core.duty_active [8]),
    .C(clknet_4_6_0_clk),
    .D(_0063_),
    .QB(_0800_),
    .VSS(VSS),
    .CLRB(net85),
    .VDD(VDD));
 DFCL11 _1495_ (.Q(\u_pwm.u_pwm_core.duty_active [9]),
    .C(clknet_4_3_0_clk),
    .D(_0064_),
    .QB(_0799_),
    .VSS(VSS),
    .CLRB(net77),
    .VDD(VDD));
 DFCL11 _1496_ (.Q(\u_pwm.u_pwm_core.duty_active [10]),
    .C(clknet_4_3_0_clk),
    .D(_0065_),
    .QB(_0798_),
    .VSS(VSS),
    .CLRB(net84),
    .VDD(VDD));
 DFCL11 _1497_ (.Q(\u_pwm.u_pwm_core.duty_active [11]),
    .C(clknet_4_4_0_clk),
    .D(_0066_),
    .QB(_0797_),
    .VSS(VSS),
    .CLRB(net94),
    .VDD(VDD));
 DFCL11 _1498_ (.Q(\u_pwm.u_pwm_core.duty_active [12]),
    .C(clknet_4_7_0_clk),
    .D(_0067_),
    .QB(_0796_),
    .VSS(VSS),
    .CLRB(net86),
    .VDD(VDD));
 DFCL11 _1499_ (.Q(\u_pwm.u_pwm_core.duty_active [13]),
    .C(clknet_4_7_0_clk),
    .D(_0068_),
    .QB(_0795_),
    .VSS(VSS),
    .CLRB(net86),
    .VDD(VDD));
 DFCL11 _1500_ (.Q(\u_pwm.u_pwm_core.duty_active [14]),
    .C(clknet_4_5_0_clk),
    .D(_0069_),
    .QB(_0794_),
    .VSS(VSS),
    .CLRB(net90),
    .VDD(VDD));
 DFCL11 _1501_ (.Q(\u_pwm.u_pwm_core.duty_active [15]),
    .C(clknet_4_7_0_clk),
    .D(_0070_),
    .QB(_0793_),
    .VSS(VSS),
    .CLRB(net86),
    .VDD(VDD));
 DFCL11 _1502_ (.Q(\u_pwm.u_pwm_core.duty_active [16]),
    .C(clknet_4_9_0_clk),
    .D(_0071_),
    .QB(_0792_),
    .VSS(VSS),
    .CLRB(net98),
    .VDD(VDD));
 DFCL11 _1503_ (.Q(\u_pwm.u_pwm_core.duty_active [17]),
    .C(clknet_4_9_0_clk),
    .D(_0072_),
    .QB(_0791_),
    .VSS(VSS),
    .CLRB(net96),
    .VDD(VDD));
 DFCL11 _1504_ (.Q(\u_pwm.u_pwm_core.duty_active [18]),
    .C(clknet_4_9_0_clk),
    .D(_0073_),
    .QB(_0790_),
    .VSS(VSS),
    .CLRB(net96),
    .VDD(VDD));
 DFCL11 _1505_ (.Q(\u_pwm.u_pwm_core.duty_active [19]),
    .C(clknet_4_12_0_clk),
    .D(_0074_),
    .QB(_0789_),
    .VSS(VSS),
    .CLRB(net108),
    .VDD(VDD));
 DFCL11 _1506_ (.Q(\u_pwm.u_pwm_core.duty_active [20]),
    .C(clknet_4_13_0_clk),
    .D(_0075_),
    .QB(_0788_),
    .VSS(VSS),
    .CLRB(net107),
    .VDD(VDD));
 DFCL11 _1507_ (.Q(\u_pwm.u_pwm_core.duty_active [21]),
    .C(clknet_4_13_0_clk),
    .D(_0076_),
    .QB(_0787_),
    .VSS(VSS),
    .CLRB(net107),
    .VDD(VDD));
 DFCL11 _1508_ (.Q(\u_pwm.u_pwm_core.duty_active [22]),
    .C(clknet_4_13_0_clk),
    .D(_0077_),
    .QB(_0786_),
    .VSS(VSS),
    .CLRB(net107),
    .VDD(VDD));
 DFCL11 _1509_ (.Q(\u_pwm.u_pwm_core.duty_active [23]),
    .C(clknet_4_13_0_clk),
    .D(_0078_),
    .QB(_0785_),
    .VSS(VSS),
    .CLRB(net107),
    .VDD(VDD));
 DFCL11 _1510_ (.Q(\u_pwm.u_pwm_core.duty_active [24]),
    .C(clknet_4_6_0_clk),
    .D(_0079_),
    .QB(_0784_),
    .VSS(VSS),
    .CLRB(net110),
    .VDD(VDD));
 DFCL11 _1511_ (.Q(\u_pwm.u_pwm_core.duty_active [25]),
    .C(clknet_4_6_0_clk),
    .D(_0080_),
    .QB(_0783_),
    .VSS(VSS),
    .CLRB(net85),
    .VDD(VDD));
 DFCL11 _1512_ (.Q(\u_pwm.u_pwm_core.duty_active [26]),
    .C(clknet_4_4_0_clk),
    .D(_0081_),
    .QB(_0782_),
    .VSS(VSS),
    .CLRB(net88),
    .VDD(VDD));
 DFCL11 _1513_ (.Q(\u_pwm.u_pwm_core.duty_active [27]),
    .C(clknet_4_4_0_clk),
    .D(_0082_),
    .QB(_0781_),
    .VSS(VSS),
    .CLRB(net87),
    .VDD(VDD));
 DFCL11 _1514_ (.Q(\u_pwm.u_pwm_core.duty_active [28]),
    .C(clknet_4_7_0_clk),
    .D(_0083_),
    .QB(_0780_),
    .VSS(VSS),
    .CLRB(net86),
    .VDD(VDD));
 DFCL11 _1515_ (.Q(\u_pwm.u_pwm_core.duty_active [29]),
    .C(clknet_4_7_0_clk),
    .D(_0084_),
    .QB(_0779_),
    .VSS(VSS),
    .CLRB(net86),
    .VDD(VDD));
 DFCL11 _1516_ (.Q(\u_pwm.u_pwm_core.duty_active [30]),
    .C(clknet_4_7_0_clk),
    .D(_0085_),
    .QB(_0778_),
    .VSS(VSS),
    .CLRB(net86),
    .VDD(VDD));
 DFCL11 _1517_ (.Q(\u_pwm.u_pwm_core.duty_active [31]),
    .C(clknet_4_13_0_clk),
    .D(_0086_),
    .QB(_0777_),
    .VSS(VSS),
    .CLRB(net107),
    .VDD(VDD));
 DFCL11 _1518_ (.Q(\u_pwm.u_pwm_core.duty_active [32]),
    .C(clknet_4_9_0_clk),
    .D(_0087_),
    .QB(_0776_),
    .VSS(VSS),
    .CLRB(net111),
    .VDD(VDD));
 DFCL11 _1519_ (.Q(\u_pwm.u_pwm_core.duty_active [33]),
    .C(clknet_4_9_0_clk),
    .D(_0088_),
    .QB(_0775_),
    .VSS(VSS),
    .CLRB(net98),
    .VDD(VDD));
 DFCL11 _1520_ (.Q(\u_pwm.u_pwm_core.duty_active [34]),
    .C(clknet_4_12_0_clk),
    .D(_0089_),
    .QB(_0774_),
    .VSS(VSS),
    .CLRB(net111),
    .VDD(VDD));
 DFCL11 _1521_ (.Q(\u_pwm.u_pwm_core.duty_active [35]),
    .C(clknet_4_14_0_clk),
    .D(_0090_),
    .QB(_0773_),
    .VSS(VSS),
    .CLRB(net114),
    .VDD(VDD));
 DFCL11 _1522_ (.Q(\u_pwm.u_pwm_core.duty_active [36]),
    .C(clknet_4_15_0_clk),
    .D(_0091_),
    .QB(_0772_),
    .VSS(VSS),
    .CLRB(net114),
    .VDD(VDD));
 DFCL11 _1523_ (.Q(\u_pwm.u_pwm_core.duty_active [37]),
    .C(clknet_4_15_0_clk),
    .D(_0092_),
    .QB(_0771_),
    .VSS(VSS),
    .CLRB(net113),
    .VDD(VDD));
 DFCL11 _1524_ (.Q(\u_pwm.u_pwm_core.duty_active [38]),
    .C(clknet_4_15_0_clk),
    .D(_0093_),
    .QB(_0770_),
    .VSS(VSS),
    .CLRB(net113),
    .VDD(VDD));
 DFCL11 _1525_ (.Q(\u_pwm.u_pwm_core.duty_active [39]),
    .C(clknet_4_15_0_clk),
    .D(_0094_),
    .QB(_0769_),
    .VSS(VSS),
    .CLRB(net113),
    .VDD(VDD));
 DFCL11 _1526_ (.Q(\u_pwm.u_pwm_core.duty_active [40]),
    .C(clknet_4_12_0_clk),
    .D(_0095_),
    .QB(_0768_),
    .VSS(VSS),
    .CLRB(net109),
    .VDD(VDD));
 DFCL11 _1527_ (.Q(\u_pwm.u_pwm_core.duty_active [41]),
    .C(clknet_4_12_0_clk),
    .D(_0096_),
    .QB(_0767_),
    .VSS(VSS),
    .CLRB(net108),
    .VDD(VDD));
 DFCL11 _1528_ (.Q(\u_pwm.u_pwm_core.duty_active [42]),
    .C(clknet_4_12_0_clk),
    .D(_0097_),
    .QB(_0766_),
    .VSS(VSS),
    .CLRB(net108),
    .VDD(VDD));
 DFCL11 _1529_ (.Q(\u_pwm.u_pwm_core.duty_active [43]),
    .C(clknet_4_12_0_clk),
    .D(_0098_),
    .QB(_0765_),
    .VSS(VSS),
    .CLRB(net109),
    .VDD(VDD));
 DFCL11 _1530_ (.Q(\u_pwm.u_pwm_core.duty_active [44]),
    .C(clknet_4_13_0_clk),
    .D(_0099_),
    .QB(_0764_),
    .VSS(VSS),
    .CLRB(net121),
    .VDD(VDD));
 DFCL11 _1531_ (.Q(\u_pwm.u_pwm_core.duty_active [45]),
    .C(clknet_4_15_0_clk),
    .D(_0100_),
    .QB(_0763_),
    .VSS(VSS),
    .CLRB(net113),
    .VDD(VDD));
 DFCL11 _1532_ (.Q(\u_pwm.u_pwm_core.duty_active [46]),
    .C(clknet_4_15_0_clk),
    .D(_0101_),
    .QB(_0762_),
    .VSS(VSS),
    .CLRB(net113),
    .VDD(VDD));
 DFCL11 _1533_ (.Q(\u_pwm.u_pwm_core.duty_active [47]),
    .C(clknet_4_14_0_clk),
    .D(_0102_),
    .QB(_0761_),
    .VSS(VSS),
    .CLRB(net115),
    .VDD(VDD));
 DFCL11 _1534_ (.Q(\u_pwm.u_pwm_core.duty_active [48]),
    .C(clknet_4_8_0_clk),
    .D(_0103_),
    .QB(_0760_),
    .VSS(VSS),
    .CLRB(net95),
    .VDD(VDD));
 DFCL11 _1535_ (.Q(\u_pwm.u_pwm_core.duty_active [49]),
    .C(clknet_4_8_0_clk),
    .D(_0104_),
    .QB(_0759_),
    .VSS(VSS),
    .CLRB(net97),
    .VDD(VDD));
 DFCL11 _1536_ (.Q(\u_pwm.u_pwm_core.duty_active [50]),
    .C(clknet_4_8_0_clk),
    .D(_0105_),
    .QB(_0758_),
    .VSS(VSS),
    .CLRB(net97),
    .VDD(VDD));
 DFCL11 _1537_ (.Q(\u_pwm.u_pwm_core.duty_active [51]),
    .C(clknet_4_11_0_clk),
    .D(_0106_),
    .QB(_0757_),
    .VSS(VSS),
    .CLRB(net103),
    .VDD(VDD));
 DFCL11 _1538_ (.Q(\u_pwm.u_pwm_core.duty_active [52]),
    .C(clknet_4_11_0_clk),
    .D(_0107_),
    .QB(_0756_),
    .VSS(VSS),
    .CLRB(net112),
    .VDD(VDD));
 DFCL11 _1539_ (.Q(\u_pwm.u_pwm_core.duty_active [53]),
    .C(clknet_4_11_0_clk),
    .D(_0108_),
    .QB(_0755_),
    .VSS(VSS),
    .CLRB(net101),
    .VDD(VDD));
 DFCL11 _1540_ (.Q(\u_pwm.u_pwm_core.duty_active [54]),
    .C(clknet_4_11_0_clk),
    .D(_0109_),
    .QB(_0754_),
    .VSS(VSS),
    .CLRB(net112),
    .VDD(VDD));
 DFCL11 _1541_ (.Q(\u_pwm.u_pwm_core.duty_active [55]),
    .C(clknet_4_14_0_clk),
    .D(_0110_),
    .QB(_0753_),
    .VSS(VSS),
    .CLRB(net116),
    .VDD(VDD));
 DFCL11 _1542_ (.Q(\u_pwm.u_pwm_core.duty_active [56]),
    .C(clknet_4_8_0_clk),
    .D(_0111_),
    .QB(_0752_),
    .VSS(VSS),
    .CLRB(net96),
    .VDD(VDD));
 DFCL11 _1543_ (.Q(\u_pwm.u_pwm_core.duty_active [57]),
    .C(clknet_4_8_0_clk),
    .D(_0112_),
    .QB(_0751_),
    .VSS(VSS),
    .CLRB(net96),
    .VDD(VDD));
 DFCL11 _1544_ (.Q(\u_pwm.u_pwm_core.duty_active [58]),
    .C(clknet_4_10_0_clk),
    .D(_0113_),
    .QB(_0750_),
    .VSS(VSS),
    .CLRB(net96),
    .VDD(VDD));
 DFCL11 _1545_ (.Q(\u_pwm.u_pwm_core.duty_active [59]),
    .C(clknet_4_10_0_clk),
    .D(_0114_),
    .QB(_0749_),
    .VSS(VSS),
    .CLRB(net102),
    .VDD(VDD));
 DFCL11 _1546_ (.Q(\u_pwm.u_pwm_core.duty_active [60]),
    .C(clknet_4_10_0_clk),
    .D(_0115_),
    .QB(_0748_),
    .VSS(VSS),
    .CLRB(net102),
    .VDD(VDD));
 DFCL11 _1547_ (.Q(\u_pwm.u_pwm_core.duty_active [61]),
    .C(clknet_4_10_0_clk),
    .D(_0116_),
    .QB(_0747_),
    .VSS(VSS),
    .CLRB(net102),
    .VDD(VDD));
 DFCL11 _1548_ (.Q(\u_pwm.u_pwm_core.duty_active [62]),
    .C(clknet_4_10_0_clk),
    .D(_0117_),
    .QB(_0746_),
    .VSS(VSS),
    .CLRB(net102),
    .VDD(VDD));
 DFCL11 _1549_ (.Q(\u_pwm.u_pwm_core.duty_active [63]),
    .C(clknet_4_11_0_clk),
    .D(_0118_),
    .QB(_0745_),
    .VSS(VSS),
    .CLRB(net101),
    .VDD(VDD));
 DFCL11 _1550_ (.Q(\u_pwm.pwm_en ),
    .C(clknet_4_0_0_clk),
    .D(_0119_),
    .QB(_0744_),
    .VSS(VSS),
    .CLRB(net76),
    .VDD(VDD));
 DFCL11 _1551_ (.Q(\u_pwm.duty [40]),
    .C(clknet_4_12_0_clk),
    .D(_0120_),
    .QB(_0743_),
    .VSS(VSS),
    .CLRB(net110),
    .VDD(VDD));
 DFCL11 _1552_ (.Q(\u_pwm.duty [41]),
    .C(clknet_4_9_0_clk),
    .D(_0121_),
    .QB(_0742_),
    .VSS(VSS),
    .CLRB(net98),
    .VDD(VDD));
 DFCL11 _1553_ (.Q(\u_pwm.duty [42]),
    .C(clknet_4_9_0_clk),
    .D(_0122_),
    .QB(_0741_),
    .VSS(VSS),
    .CLRB(net111),
    .VDD(VDD));
 DFCL11 _1554_ (.Q(\u_pwm.duty [43]),
    .C(clknet_4_12_0_clk),
    .D(_0123_),
    .QB(_0740_),
    .VSS(VSS),
    .CLRB(net110),
    .VDD(VDD));
 DFCL11 _1555_ (.Q(\u_pwm.duty [44]),
    .C(clknet_4_13_0_clk),
    .D(_0124_),
    .QB(_0739_),
    .VSS(VSS),
    .CLRB(net122),
    .VDD(VDD));
 DFCL11 _1556_ (.Q(\u_pwm.duty [45]),
    .C(clknet_4_14_0_clk),
    .D(_0125_),
    .QB(_0738_),
    .VSS(VSS),
    .CLRB(net114),
    .VDD(VDD));
 DFCL11 _1557_ (.Q(\u_pwm.duty [46]),
    .C(clknet_4_15_0_clk),
    .D(_0126_),
    .QB(_0737_),
    .VSS(VSS),
    .CLRB(net113),
    .VDD(VDD));
 DFCL11 _1558_ (.Q(\u_pwm.duty [47]),
    .C(clknet_4_14_0_clk),
    .D(_0127_),
    .QB(_0736_),
    .VSS(VSS),
    .CLRB(net115),
    .VDD(VDD));
 DFCL11 _1559_ (.Q(\u_pwm.prescaler [0]),
    .C(clknet_4_2_0_clk),
    .D(_0128_),
    .QB(_0735_),
    .VSS(VSS),
    .CLRB(net78),
    .VDD(VDD));
 DFCL11 _1560_ (.Q(\u_pwm.prescaler [1]),
    .C(clknet_4_2_0_clk),
    .D(_0129_),
    .QB(_0734_),
    .VSS(VSS),
    .CLRB(net80),
    .VDD(VDD));
 DFCL11 _1561_ (.Q(\u_pwm.prescaler [2]),
    .C(clknet_4_2_0_clk),
    .D(_0130_),
    .QB(_0733_),
    .VSS(VSS),
    .CLRB(net80),
    .VDD(VDD));
 DFCL11 _1562_ (.Q(\u_pwm.prescaler [3]),
    .C(clknet_4_0_0_clk),
    .D(_0131_),
    .QB(_0732_),
    .VSS(VSS),
    .CLRB(net77),
    .VDD(VDD));
 DFCL11 _1563_ (.Q(\u_pwm.prescaler [4]),
    .C(clknet_4_2_0_clk),
    .D(_0132_),
    .QB(_0731_),
    .VSS(VSS),
    .CLRB(net77),
    .VDD(VDD));
 DFCL11 _1564_ (.Q(\u_pwm.prescaler [5]),
    .C(clknet_4_3_0_clk),
    .D(_0133_),
    .QB(_0730_),
    .VSS(VSS),
    .CLRB(net77),
    .VDD(VDD));
 DFCL11 _1565_ (.Q(\u_pwm.prescaler [6]),
    .C(clknet_4_2_0_clk),
    .D(_0134_),
    .QB(_0729_),
    .VSS(VSS),
    .CLRB(net78),
    .VDD(VDD));
 DFCL11 _1566_ (.Q(\u_pwm.prescaler [7]),
    .C(clknet_4_2_0_clk),
    .D(_0135_),
    .QB(_0728_),
    .VSS(VSS),
    .CLRB(net78),
    .VDD(VDD));
 DFCL11 _1567_ (.Q(\u_pwm.duty [24]),
    .C(clknet_4_6_0_clk),
    .D(_0136_),
    .QB(_0727_),
    .VSS(VSS),
    .CLRB(net110),
    .VDD(VDD));
 DFCL11 _1568_ (.Q(\u_pwm.duty [25]),
    .C(clknet_4_3_0_clk),
    .D(_0137_),
    .QB(_0726_),
    .VSS(VSS),
    .CLRB(net82),
    .VDD(VDD));
 DFCL11 _1569_ (.Q(\u_pwm.duty [26]),
    .C(clknet_4_1_0_clk),
    .D(_0138_),
    .QB(_0725_),
    .VSS(VSS),
    .CLRB(net84),
    .VDD(VDD));
 DFCL11 _1570_ (.Q(\u_pwm.duty [27]),
    .C(clknet_4_4_0_clk),
    .D(_0139_),
    .QB(_0724_),
    .VSS(VSS),
    .CLRB(net88),
    .VDD(VDD));
 DFCL11 _1571_ (.Q(\u_pwm.duty [28]),
    .C(clknet_4_7_0_clk),
    .D(_0140_),
    .QB(_0723_),
    .VSS(VSS),
    .CLRB(net85),
    .VDD(VDD));
 DFCL11 _1572_ (.Q(\u_pwm.duty [29]),
    .C(clknet_4_5_0_clk),
    .D(_0141_),
    .QB(_0722_),
    .VSS(VSS),
    .CLRB(net87),
    .VDD(VDD));
 DFCL11 _1573_ (.Q(\u_pwm.duty [30]),
    .C(clknet_4_7_0_clk),
    .D(_0142_),
    .QB(_0721_),
    .VSS(VSS),
    .CLRB(net91),
    .VDD(VDD));
 DFCL11 _1574_ (.Q(\u_pwm.duty [31]),
    .C(clknet_4_13_0_clk),
    .D(_0143_),
    .QB(_0720_),
    .VSS(VSS),
    .CLRB(net122),
    .VDD(VDD));
 DFCL11 _1575_ (.Q(\u_pwm.duty [0]),
    .C(clknet_4_3_0_clk),
    .D(_0144_),
    .QB(_0719_),
    .VSS(VSS),
    .CLRB(net82),
    .VDD(VDD));
 DFCL11 _1576_ (.Q(\u_pwm.duty [1]),
    .C(clknet_4_1_0_clk),
    .D(_0145_),
    .QB(_0718_),
    .VSS(VSS),
    .CLRB(net82),
    .VDD(VDD));
 DFCL11 _1577_ (.Q(\u_pwm.duty [2]),
    .C(clknet_4_1_0_clk),
    .D(_0146_),
    .QB(_0717_),
    .VSS(VSS),
    .CLRB(net89),
    .VDD(VDD));
 DFCL11 _1578_ (.Q(\u_pwm.duty [3]),
    .C(clknet_4_6_0_clk),
    .D(_0147_),
    .QB(_0716_),
    .VSS(VSS),
    .CLRB(net85),
    .VDD(VDD));
 DFCL11 _1579_ (.Q(\u_pwm.duty [4]),
    .C(clknet_4_6_0_clk),
    .D(_0148_),
    .QB(_0715_),
    .VSS(VSS),
    .CLRB(net85),
    .VDD(VDD));
 DFCL11 _1580_ (.Q(\u_pwm.duty [5]),
    .C(clknet_4_5_0_clk),
    .D(_0149_),
    .QB(_0714_),
    .VSS(VSS),
    .CLRB(net93),
    .VDD(VDD));
 DFCL11 _1581_ (.Q(\u_pwm.duty [6]),
    .C(clknet_4_5_0_clk),
    .D(_0150_),
    .QB(_0713_),
    .VSS(VSS),
    .CLRB(net93),
    .VDD(VDD));
 DFCL11 _1582_ (.Q(\u_pwm.duty [7]),
    .C(clknet_4_5_0_clk),
    .D(_0151_),
    .QB(_0712_),
    .VSS(VSS),
    .CLRB(net90),
    .VDD(VDD));
 DFCL11 _1583_ (.Q(\u_pwm.duty [8]),
    .C(clknet_4_3_0_clk),
    .D(_0152_),
    .QB(_0711_),
    .VSS(VSS),
    .CLRB(net85),
    .VDD(VDD));
 DFCL11 _1584_ (.Q(\u_pwm.duty [9]),
    .C(clknet_4_1_0_clk),
    .D(_0153_),
    .QB(_0710_),
    .VSS(VSS),
    .CLRB(net82),
    .VDD(VDD));
 DFCL11 _1585_ (.Q(\u_pwm.duty [10]),
    .C(clknet_4_1_0_clk),
    .D(_0154_),
    .QB(_0709_),
    .VSS(VSS),
    .CLRB(net82),
    .VDD(VDD));
 DFCL11 _1586_ (.Q(\u_pwm.duty [11]),
    .C(clknet_4_4_0_clk),
    .D(_0155_),
    .QB(_0708_),
    .VSS(VSS),
    .CLRB(net94),
    .VDD(VDD));
 DFCL11 _1587_ (.Q(\u_pwm.duty [12]),
    .C(clknet_4_7_0_clk),
    .D(_0156_),
    .QB(_0707_),
    .VSS(VSS),
    .CLRB(net91),
    .VDD(VDD));
 DFCL11 _1588_ (.Q(\u_pwm.duty [13]),
    .C(clknet_4_7_0_clk),
    .D(_0157_),
    .QB(_0706_),
    .VSS(VSS),
    .CLRB(net91),
    .VDD(VDD));
 DFCL11 _1589_ (.Q(\u_pwm.duty [14]),
    .C(clknet_4_5_0_clk),
    .D(_0158_),
    .QB(_0705_),
    .VSS(VSS),
    .CLRB(net90),
    .VDD(VDD));
 DFCL11 _1590_ (.Q(\u_pwm.duty [15]),
    .C(clknet_4_7_0_clk),
    .D(_0159_),
    .QB(_0704_),
    .VSS(VSS),
    .CLRB(net91),
    .VDD(VDD));
 DFCL11 _1591_ (.Q(\u_pwm.duty [32]),
    .C(clknet_4_9_0_clk),
    .D(_0160_),
    .QB(_0703_),
    .VSS(VSS),
    .CLRB(net106),
    .VDD(VDD));
 DFCL11 _1592_ (.Q(\u_pwm.duty [33]),
    .C(clknet_4_9_0_clk),
    .D(_0161_),
    .QB(_0702_),
    .VSS(VSS),
    .CLRB(net98),
    .VDD(VDD));
 DFCL11 _1593_ (.Q(\u_pwm.duty [34]),
    .C(clknet_4_11_0_clk),
    .D(_0162_),
    .QB(_0701_),
    .VSS(VSS),
    .CLRB(net111),
    .VDD(VDD));
 DFCL11 _1594_ (.Q(\u_pwm.duty [35]),
    .C(clknet_4_14_0_clk),
    .D(_0163_),
    .QB(_0700_),
    .VSS(VSS),
    .CLRB(net115),
    .VDD(VDD));
 DFCL11 _1595_ (.Q(\u_pwm.duty [36]),
    .C(clknet_4_15_0_clk),
    .D(_0164_),
    .QB(_0699_),
    .VSS(VSS),
    .CLRB(net120),
    .VDD(VDD));
 DFCL11 _1596_ (.Q(\u_pwm.duty [37]),
    .C(clknet_4_15_0_clk),
    .D(_0165_),
    .QB(_0698_),
    .VSS(VSS),
    .CLRB(net118),
    .VDD(VDD));
 DFCL11 _1597_ (.Q(\u_pwm.duty [38]),
    .C(clknet_4_15_0_clk),
    .D(_0166_),
    .QB(_0697_),
    .VSS(VSS),
    .CLRB(net119),
    .VDD(VDD));
 DFCL11 _1598_ (.Q(\u_pwm.duty [39]),
    .C(clknet_4_15_0_clk),
    .D(_0167_),
    .QB(_0696_),
    .VSS(VSS),
    .CLRB(net118),
    .VDD(VDD));
 DFCL11 _1599_ (.Q(\u_pwm.duty [16]),
    .C(clknet_4_9_0_clk),
    .D(_0168_),
    .QB(_0695_),
    .VSS(VSS),
    .CLRB(net98),
    .VDD(VDD));
 DFCL11 _1600_ (.Q(\u_pwm.duty [17]),
    .C(clknet_4_8_0_clk),
    .D(_0169_),
    .QB(_0694_),
    .VSS(VSS),
    .CLRB(net98),
    .VDD(VDD));
 DFCL11 _1601_ (.Q(\u_pwm.duty [18]),
    .C(clknet_4_9_0_clk),
    .D(_0170_),
    .QB(_0693_),
    .VSS(VSS),
    .CLRB(net103),
    .VDD(VDD));
 DFCL11 _1602_ (.Q(\u_pwm.duty [19]),
    .C(clknet_4_12_0_clk),
    .D(_0171_),
    .QB(_0692_),
    .VSS(VSS),
    .CLRB(net108),
    .VDD(VDD));
 DFCL11 _1603_ (.Q(\u_pwm.duty [20]),
    .C(clknet_4_12_0_clk),
    .D(_0172_),
    .QB(_0691_),
    .VSS(VSS),
    .CLRB(net120),
    .VDD(VDD));
 DFCL11 _1604_ (.Q(\u_pwm.duty [21]),
    .C(clknet_4_13_0_clk),
    .D(_0173_),
    .QB(_0690_),
    .VSS(VSS),
    .CLRB(net119),
    .VDD(VDD));
 DFCL11 _1605_ (.Q(\u_pwm.duty [22]),
    .C(clknet_4_13_0_clk),
    .D(_0174_),
    .QB(_0689_),
    .VSS(VSS),
    .CLRB(net121),
    .VDD(VDD));
 DFCL11 _1606_ (.Q(\u_pwm.duty [23]),
    .C(clknet_4_13_0_clk),
    .D(_0175_),
    .QB(_0817_),
    .VSS(VSS),
    .CLRB(net119),
    .VDD(VDD));
 DFCL11 _1607_ (.Q(\u_pwm.u_wr_toggle_sync.sync_ff2 ),
    .C(clknet_4_0_0_clk),
    .D(\u_pwm.u_wr_toggle_sync.sync_ff1 ),
    .QB(_0818_),
    .VSS(VSS),
    .CLRB(net81),
    .VDD(VDD));
 DFCL11 _1608_ (.Q(\u_pwm.u_wr_toggle_sync.sync_ff1 ),
    .C(clknet_4_0_0_clk),
    .D(\u_pwm.u_spi.wr_toggle ),
    .QB(_0688_),
    .VSS(VSS),
    .CLRB(net81),
    .VDD(VDD));
 DFCL11 _1609_ (.Q(\u_pwm.duty [56]),
    .C(clknet_4_8_0_clk),
    .D(_0176_),
    .QB(_0687_),
    .VSS(VSS),
    .CLRB(net104),
    .VDD(VDD));
 DFCL11 _1610_ (.Q(\u_pwm.duty [57]),
    .C(clknet_4_8_0_clk),
    .D(_0177_),
    .QB(_0686_),
    .VSS(VSS),
    .CLRB(net104),
    .VDD(VDD));
 DFCL11 _1611_ (.Q(\u_pwm.duty [58]),
    .C(clknet_4_9_0_clk),
    .D(_0178_),
    .QB(_0685_),
    .VSS(VSS),
    .CLRB(net104),
    .VDD(VDD));
 DFCL11 _1612_ (.Q(\u_pwm.duty [59]),
    .C(clknet_4_11_0_clk),
    .D(_0179_),
    .QB(_0684_),
    .VSS(VSS),
    .CLRB(net103),
    .VDD(VDD));
 DFCL11 _1613_ (.Q(\u_pwm.duty [60]),
    .C(clknet_4_10_0_clk),
    .D(_0180_),
    .QB(_0683_),
    .VSS(VSS),
    .CLRB(net102),
    .VDD(VDD));
 DFCL11 _1614_ (.Q(\u_pwm.duty [61]),
    .C(clknet_4_11_0_clk),
    .D(_0181_),
    .QB(_0682_),
    .VSS(VSS),
    .CLRB(net101),
    .VDD(VDD));
 DFCL11 _1615_ (.Q(\u_pwm.duty [62]),
    .C(clknet_4_10_0_clk),
    .D(_0182_),
    .QB(_0681_),
    .VSS(VSS),
    .CLRB(net102),
    .VDD(VDD));
 DFCL11 _1616_ (.Q(\u_pwm.duty [63]),
    .C(clknet_4_11_0_clk),
    .D(_0183_),
    .QB(_0680_),
    .VSS(VSS),
    .CLRB(net101),
    .VDD(VDD));
 DFCL11 _1617_ (.Q(\u_pwm.rd_addr [0]),
    .C(clknet_2_0__leaf_sclk),
    .D(mosi),
    .QB(_0679_),
    .VSS(VSS),
    .CLRB(_0012_),
    .VDD(VDD));
 DFCL11 _1618_ (.Q(\u_pwm.rd_addr [1]),
    .C(clknet_2_0__leaf_sclk),
    .D(\u_pwm.rd_addr [0]),
    .QB(_0678_),
    .VSS(VSS),
    .CLRB(_0013_),
    .VDD(VDD));
 DFCL11 _1619_ (.Q(\u_pwm.rd_addr [2]),
    .C(clknet_2_0__leaf_sclk),
    .D(\u_pwm.rd_addr [1]),
    .QB(_0677_),
    .VSS(VSS),
    .CLRB(_0014_),
    .VDD(VDD));
 DFCL11 _1620_ (.Q(\u_pwm.rd_addr [3]),
    .C(clknet_2_1__leaf_sclk),
    .D(\u_pwm.rd_addr [2]),
    .QB(_0676_),
    .VSS(VSS),
    .CLRB(_0015_),
    .VDD(VDD));
 DFCL11 _1621_ (.Q(\u_pwm.rd_addr [4]),
    .C(clknet_2_1__leaf_sclk),
    .D(\u_pwm.rd_addr [3]),
    .QB(_0675_),
    .VSS(VSS),
    .CLRB(_0016_),
    .VDD(VDD));
 DFCL11 _1622_ (.Q(\u_pwm.rd_addr [5]),
    .C(clknet_2_0__leaf_sclk),
    .D(\u_pwm.rd_addr [4]),
    .QB(_0674_),
    .VSS(VSS),
    .CLRB(_0017_),
    .VDD(VDD));
 DFCL11 _1623_ (.Q(\u_pwm.rd_addr [6]),
    .C(clknet_2_3__leaf_sclk),
    .D(\u_pwm.rd_addr [5]),
    .QB(_0673_),
    .VSS(VSS),
    .CLRB(_0018_),
    .VDD(VDD));
 DFCL11 _1624_ (.Q(\u_pwm.u_spi.shift_in [7]),
    .C(clknet_2_3__leaf_sclk),
    .D(\u_pwm.rd_addr [6]),
    .QB(_0672_),
    .VSS(VSS),
    .CLRB(_0019_),
    .VDD(VDD));
 DFCL11 _1625_ (.Q(\u_pwm.u_spi.shift_in [8]),
    .C(clknet_2_0__leaf_sclk),
    .D(\u_pwm.u_spi.shift_in [7]),
    .QB(_0671_),
    .VSS(VSS),
    .CLRB(_0020_),
    .VDD(VDD));
 DFCL11 _1626_ (.Q(\u_pwm.u_spi.shift_in [9]),
    .C(clknet_2_0__leaf_sclk),
    .D(\u_pwm.u_spi.shift_in [8]),
    .QB(_0670_),
    .VSS(VSS),
    .CLRB(_0021_),
    .VDD(VDD));
 DFCL11 _1627_ (.Q(\u_pwm.u_spi.shift_in [10]),
    .C(clknet_2_1__leaf_sclk),
    .D(\u_pwm.u_spi.shift_in [9]),
    .QB(_0669_),
    .VSS(VSS),
    .CLRB(_0022_),
    .VDD(VDD));
 DFCL11 _1628_ (.Q(\u_pwm.u_spi.shift_in [11]),
    .C(clknet_2_0__leaf_sclk),
    .D(\u_pwm.u_spi.shift_in [10]),
    .QB(_0668_),
    .VSS(VSS),
    .CLRB(_0023_),
    .VDD(VDD));
 DFCL11 _1629_ (.Q(\u_pwm.u_spi.shift_in [12]),
    .C(clknet_2_0__leaf_sclk),
    .D(\u_pwm.u_spi.shift_in [11]),
    .QB(_0667_),
    .VSS(VSS),
    .CLRB(_0024_),
    .VDD(VDD));
 DFCL11 _1630_ (.Q(\u_pwm.u_spi.shift_in [13]),
    .C(clknet_2_0__leaf_sclk),
    .D(\u_pwm.u_spi.shift_in [12]),
    .QB(_0666_),
    .VSS(VSS),
    .CLRB(_0025_),
    .VDD(VDD));
 DFCL11 _1631_ (.Q(\u_pwm.u_spi.shift_in [14]),
    .C(clknet_2_2__leaf_sclk),
    .D(\u_pwm.u_spi.shift_in [13]),
    .QB(_0665_),
    .VSS(VSS),
    .CLRB(_0026_),
    .VDD(VDD));
 DFCL11 _1632_ (.Q(\u_pwm.u_spi.shift_out [0]),
    .C(_0028_),
    .D(_0184_),
    .QB(_0664_),
    .VSS(VSS),
    .CLRB(_0027_),
    .VDD(VDD));
 DFCL11 _1633_ (.Q(\u_pwm.u_spi.shift_out [1]),
    .C(_0030_),
    .D(_0185_),
    .QB(_0663_),
    .VSS(VSS),
    .CLRB(_0029_),
    .VDD(VDD));
 DFCL11 _1634_ (.Q(\u_pwm.u_spi.shift_out [2]),
    .C(_0032_),
    .D(_0186_),
    .QB(_0662_),
    .VSS(VSS),
    .CLRB(_0031_),
    .VDD(VDD));
 DFCL11 _1635_ (.Q(\u_pwm.u_spi.shift_out [3]),
    .C(_0034_),
    .D(_0187_),
    .QB(_0661_),
    .VSS(VSS),
    .CLRB(_0033_),
    .VDD(VDD));
 DFCL11 _1636_ (.Q(\u_pwm.u_spi.shift_out [4]),
    .C(_0036_),
    .D(_0188_),
    .QB(_0660_),
    .VSS(VSS),
    .CLRB(_0035_),
    .VDD(VDD));
 DFCL11 _1637_ (.Q(\u_pwm.u_spi.shift_out [5]),
    .C(_0038_),
    .D(_0189_),
    .QB(_0659_),
    .VSS(VSS),
    .CLRB(_0037_),
    .VDD(VDD));
 DFCL11 _1638_ (.Q(\u_pwm.u_spi.shift_out [6]),
    .C(_0040_),
    .D(_0190_),
    .QB(_0658_),
    .VSS(VSS),
    .CLRB(_0039_),
    .VDD(VDD));
 DFCL11 _1639_ (.Q(miso),
    .C(_0042_),
    .D(_0191_),
    .QB(_0657_),
    .VSS(VSS),
    .CLRB(_0041_),
    .VDD(VDD));
 DFCL11 _1640_ (.Q(\u_pwm.u_reg_bank.wr_addr [0]),
    .C(clknet_2_0__leaf_sclk),
    .D(_0192_),
    .QB(_0656_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1641_ (.Q(\u_pwm.u_reg_bank.wr_addr [1]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0193_),
    .QB(_0655_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1642_ (.Q(\u_pwm.u_reg_bank.wr_addr [2]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0194_),
    .QB(_0654_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1643_ (.Q(\u_pwm.u_reg_bank.wr_addr [3]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0195_),
    .QB(_0653_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1644_ (.Q(\u_pwm.u_reg_bank.wr_addr [4]),
    .C(clknet_2_0__leaf_sclk),
    .D(_0196_),
    .QB(_0652_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1645_ (.Q(\u_pwm.u_reg_bank.wr_addr [5]),
    .C(clknet_2_0__leaf_sclk),
    .D(_0197_),
    .QB(_0651_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1646_ (.Q(\u_pwm.u_reg_bank.wr_addr [6]),
    .C(clknet_2_0__leaf_sclk),
    .D(_0198_),
    .QB(_0650_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1647_ (.Q(\u_pwm.u_reg_bank.wr_data [0]),
    .C(clknet_2_2__leaf_sclk),
    .D(_0199_),
    .QB(_0649_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1648_ (.Q(\u_pwm.u_reg_bank.wr_data [1]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0200_),
    .QB(_0648_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1649_ (.Q(\u_pwm.u_reg_bank.wr_data [2]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0201_),
    .QB(_0647_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1650_ (.Q(\u_pwm.u_reg_bank.wr_data [3]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0202_),
    .QB(_0646_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1651_ (.Q(\u_pwm.u_reg_bank.wr_data [4]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0203_),
    .QB(_0645_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1652_ (.Q(\u_pwm.u_reg_bank.wr_data [5]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0204_),
    .QB(_0644_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1653_ (.Q(\u_pwm.u_reg_bank.wr_data [6]),
    .C(clknet_2_1__leaf_sclk),
    .D(_0205_),
    .QB(_0643_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1654_ (.Q(\u_pwm.u_reg_bank.wr_data [7]),
    .C(clknet_2_3__leaf_sclk),
    .D(_0206_),
    .QB(_0642_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1655_ (.Q(\u_pwm.u_spi.bit_cnt [0]),
    .C(clknet_2_2__leaf_sclk),
    .D(_0628_[0]),
    .QB(_0628_[0]),
    .VSS(VSS),
    .CLRB(_0043_),
    .VDD(VDD));
 DFCL11 _1656_ (.Q(\u_pwm.u_spi.bit_cnt [1]),
    .C(clknet_2_2__leaf_sclk),
    .D(_0629_[1]),
    .QB(_0641_),
    .VSS(VSS),
    .CLRB(_0044_),
    .VDD(VDD));
 DFCL11 _1657_ (.Q(\u_pwm.u_spi.bit_cnt [2]),
    .C(clknet_2_2__leaf_sclk),
    .D(_0629_[2]),
    .QB(_0640_),
    .VSS(VSS),
    .CLRB(_0045_),
    .VDD(VDD));
 DFCL11 _1658_ (.Q(\u_pwm.u_spi.bit_cnt [3]),
    .C(clknet_2_2__leaf_sclk),
    .D(_0629_[3]),
    .QB(_0819_),
    .VSS(VSS),
    .CLRB(_0046_),
    .VDD(VDD));
 DFCL11 _1659_ (.Q(\u_pwm.u_rst_sync.rst_ff2 ),
    .C(clknet_4_0_0_clk),
    .D(\u_pwm.u_rst_sync.rst_ff1 ),
    .QB(_0820_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1660_ (.Q(\u_pwm.u_rst_sync.rst_ff1 ),
    .C(clknet_4_0_0_clk),
    .D(_0839_),
    .QB(_0821_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1661_ (.Q(\u_pwm.wr_toggle_seen ),
    .C(clknet_4_0_0_clk),
    .D(\u_pwm.u_wr_toggle_sync.sync_ff2 ),
    .QB(_0639_),
    .VSS(VSS),
    .CLRB(net81),
    .VDD(VDD));
 DFCL11 _1662_ (.Q(\u_pwm.u_spi.wr_toggle ),
    .C(clknet_2_0__leaf_sclk),
    .D(_0207_),
    .QB(_0010_),
    .VSS(VSS),
    .CLRB(rst_n),
    .VDD(VDD));
 DFCL11 _1663_ (.Q(\u_pwm.u_pwm_core.wrap ),
    .C(clknet_4_10_0_clk),
    .D(_0009_),
    .QB(_0822_),
    .VSS(VSS),
    .CLRB(net105),
    .VDD(VDD));
 DFCL11 _1664_ (.Q(pwm_out[0]),
    .C(clknet_4_5_0_clk),
    .D(\u_pwm.u_pwm_core.pwm_next [0]),
    .QB(_0823_),
    .VSS(VSS),
    .CLRB(net90),
    .VDD(VDD));
 DFCL11 _1665_ (.Q(pwm_out[1]),
    .C(clknet_4_7_0_clk),
    .D(\u_pwm.u_pwm_core.pwm_next [1]),
    .QB(_0824_),
    .VSS(VSS),
    .CLRB(net90),
    .VDD(VDD));
 DFCL11 _1666_ (.Q(pwm_out[2]),
    .C(clknet_4_13_0_clk),
    .D(\u_pwm.u_pwm_core.pwm_next [2]),
    .QB(_0825_),
    .VSS(VSS),
    .CLRB(net122),
    .VDD(VDD));
 DFCL11 _1667_ (.Q(pwm_out[3]),
    .C(clknet_4_13_0_clk),
    .D(\u_pwm.u_pwm_core.pwm_next [3]),
    .QB(_0826_),
    .VSS(VSS),
    .CLRB(net119),
    .VDD(VDD));
 DFCL11 _1668_ (.Q(pwm_out[4]),
    .C(clknet_4_15_0_clk),
    .D(\u_pwm.u_pwm_core.pwm_next [4]),
    .QB(_0827_),
    .VSS(VSS),
    .CLRB(net118),
    .VDD(VDD));
 DFCL11 _1669_ (.Q(pwm_out[5]),
    .C(clknet_4_15_0_clk),
    .D(\u_pwm.u_pwm_core.pwm_next [5]),
    .QB(_0828_),
    .VSS(VSS),
    .CLRB(net118),
    .VDD(VDD));
 DFCL11 _1670_ (.Q(pwm_out[6]),
    .C(clknet_4_14_0_clk),
    .D(\u_pwm.u_pwm_core.pwm_next [6]),
    .QB(_0829_),
    .VSS(VSS),
    .CLRB(net112),
    .VDD(VDD));
 DFCL11 _1671_ (.Q(pwm_out[7]),
    .C(clknet_4_10_0_clk),
    .D(\u_pwm.u_pwm_core.pwm_next [7]),
    .QB(_0830_),
    .VSS(VSS),
    .CLRB(net124),
    .VDD(VDD));
 DFCL11 _1672_ (.Q(sync),
    .C(clknet_4_0_0_clk),
    .D(_0008_),
    .QB(_0831_),
    .VSS(VSS),
    .CLRB(net83),
    .VDD(VDD));
 DFCL11 _1673_ (.Q(\u_pwm.u_pwm_core.prescale_count [0]),
    .C(clknet_4_2_0_clk),
    .D(_0000_),
    .QB(_0832_),
    .VSS(VSS),
    .CLRB(net79),
    .VDD(VDD));
 DFCL11 _1674_ (.Q(\u_pwm.u_pwm_core.prescale_count [1]),
    .C(clknet_4_2_0_clk),
    .D(_0001_),
    .QB(_0833_),
    .VSS(VSS),
    .CLRB(net79),
    .VDD(VDD));
 DFCL11 _1675_ (.Q(\u_pwm.u_pwm_core.prescale_count [2]),
    .C(clknet_4_2_0_clk),
    .D(_0002_),
    .QB(_0834_),
    .VSS(VSS),
    .CLRB(net79),
    .VDD(VDD));
 DFCL11 _1676_ (.Q(\u_pwm.u_pwm_core.prescale_count [3]),
    .C(clknet_4_2_0_clk),
    .D(_0003_),
    .QB(_0835_),
    .VSS(VSS),
    .CLRB(net79),
    .VDD(VDD));
 DFCL11 _1677_ (.Q(\u_pwm.u_pwm_core.prescale_count [4]),
    .C(clknet_4_2_0_clk),
    .D(_0004_),
    .QB(_0836_),
    .VSS(VSS),
    .CLRB(net79),
    .VDD(VDD));
 DFCL11 _1678_ (.Q(\u_pwm.u_pwm_core.prescale_count [5]),
    .C(clknet_4_2_0_clk),
    .D(_0005_),
    .QB(_0837_),
    .VSS(VSS),
    .CLRB(net78),
    .VDD(VDD));
 DFCL11 _1679_ (.Q(\u_pwm.u_pwm_core.prescale_count [6]),
    .C(clknet_4_8_0_clk),
    .D(_0006_),
    .QB(_0838_),
    .VSS(VSS),
    .CLRB(net79),
    .VDD(VDD));
 DFCL11 _1680_ (.Q(\u_pwm.u_pwm_core.prescale_count [7]),
    .C(clknet_4_8_0_clk),
    .D(_0007_),
    .QB(_0638_),
    .VSS(VSS),
    .CLRB(net95),
    .VDD(VDD));
 DFCL11 _1681_ (.Q(\u_pwm.u_pwm_core.phase [0]),
    .C(clknet_4_8_0_clk),
    .D(_0208_),
    .QB(_0637_),
    .VSS(VSS),
    .CLRB(net99),
    .VDD(VDD));
 DFCL11 _1682_ (.Q(\u_pwm.u_pwm_core.phase [1]),
    .C(clknet_4_8_0_clk),
    .D(_0209_),
    .QB(_0636_),
    .VSS(VSS),
    .CLRB(net99),
    .VDD(VDD));
 DFCL11 _1683_ (.Q(\u_pwm.u_pwm_core.phase [2]),
    .C(clknet_4_8_0_clk),
    .D(_0210_),
    .QB(_0635_),
    .VSS(VSS),
    .CLRB(net99),
    .VDD(VDD));
 DFCL11 _1684_ (.Q(\u_pwm.u_pwm_core.phase [3]),
    .C(clknet_4_8_0_clk),
    .D(_0211_),
    .QB(_0634_),
    .VSS(VSS),
    .CLRB(net97),
    .VDD(VDD));
 DFCL11 _1685_ (.Q(\u_pwm.u_pwm_core.phase [4]),
    .C(clknet_4_10_0_clk),
    .D(_0212_),
    .QB(_0633_),
    .VSS(VSS),
    .CLRB(net124),
    .VDD(VDD));
 DFCL11 _1686_ (.Q(\u_pwm.u_pwm_core.phase [5]),
    .C(clknet_4_10_0_clk),
    .D(_0213_),
    .QB(_0632_),
    .VSS(VSS),
    .CLRB(net124),
    .VDD(VDD));
 DFCL11 _1687_ (.Q(\u_pwm.u_pwm_core.phase [6]),
    .C(clknet_4_10_0_clk),
    .D(_0214_),
    .QB(_0631_),
    .VSS(VSS),
    .CLRB(net124),
    .VDD(VDD));
 DFCL11 _1688_ (.Q(\u_pwm.u_pwm_core.phase [7]),
    .C(clknet_4_10_0_clk),
    .D(_0215_),
    .QB(_0630_),
    .VSS(VSS),
    .CLRB(net124),
    .VDD(VDD));
 VDDCON _1689_ (.VSS(VSS),
    .TIEHI(_0839_),
    .VDD(VDD));
 INVR05 \drv_pwm[0].u_drv  (.OUT1(pwm_pn[0]),
    .VSS(VSS),
    .IN1(pwm_out[0]),
    .VDD(VDD));
 INVR05 \drv_pwm[1].u_drv  (.OUT1(pwm_pn[1]),
    .VSS(VSS),
    .IN1(pwm_out[1]),
    .VDD(VDD));
 INVR05 \drv_pwm[2].u_drv  (.OUT1(pwm_pn[2]),
    .VSS(VSS),
    .IN1(pwm_out[2]),
    .VDD(VDD));
 INVR05 \drv_pwm[3].u_drv  (.OUT1(pwm_pn[3]),
    .VSS(VSS),
    .IN1(pwm_out[3]),
    .VDD(VDD));
 INVR05 \drv_pwm[4].u_drv  (.OUT1(pwm_pn[4]),
    .VSS(VSS),
    .IN1(pwm_out[4]),
    .VDD(VDD));
 INVR05 \drv_pwm[5].u_drv  (.OUT1(pwm_pn[5]),
    .VSS(VSS),
    .IN1(pwm_out[5]),
    .VDD(VDD));
 INVR05 \drv_pwm[6].u_drv  (.OUT1(pwm_pn[6]),
    .VSS(VSS),
    .IN1(pwm_out[6]),
    .VDD(VDD));
 INVR05 \drv_pwm[7].u_drv  (.OUT1(pwm_pn[7]),
    .VSS(VSS),
    .IN1(pwm_out[7]),
    .VDD(VDD));
 INVR05 u_drv_miso (.OUT1(miso_pn),
    .VSS(VSS),
    .IN1(miso),
    .VDD(VDD));
 INVR05 u_drv_sync (.OUT1(sync_pn),
    .VSS(VSS),
    .IN1(sync),
    .VDD(VDD));
 CDRI01 fanout1 (.Q(net1),
    .IN1(net23));
 CDRI01 max_cap2 (.Q(net2),
    .IN1(net3));
 CDRI01 wire3 (.Q(net3),
    .IN1(net6));
 CDRI01 max_cap4 (.Q(net4),
    .IN1(net5));
 CDRI01 max_cap5 (.Q(net5),
    .IN1(net6));
 CDRI01 max_cap6 (.Q(net6),
    .IN1(net1));
 CDRI01 max_cap7 (.Q(net7),
    .IN1(net1));
 CDRI01 fanout8 (.Q(net8),
    .IN1(net24));
 CDRI01 max_cap9 (.Q(net9),
    .IN1(net11));
 CDRI01 max_cap10 (.Q(net10),
    .IN1(net11));
 CDRI01 wire11 (.Q(net11),
    .IN1(net13));
 CDRI01 max_cap12 (.Q(net12),
    .IN1(net13));
 CDRI01 max_cap13 (.Q(net13),
    .IN1(net14));
 CDRI01 max_cap14 (.Q(net14),
    .IN1(net15));
 CDRI01 wire15 (.Q(net15),
    .IN1(net8));
 CDRI01 fanout16 (.Q(net16),
    .IN1(net24));
 CDRI01 wire17 (.Q(net17),
    .IN1(net19));
 CDRI01 max_cap18 (.Q(net18),
    .IN1(net19));
 CDRI01 wire19 (.Q(net19),
    .IN1(net21));
 CDRI01 max_cap20 (.Q(net20),
    .IN1(net21));
 CDRI01 max_cap21 (.Q(net21),
    .IN1(net16));
 CDRI01 fanout22 (.Q(net22),
    .IN1(_0610_));
 CDRI01 max_cap23 (.Q(net23),
    .IN1(net25));
 CDRI01 wire24 (.Q(net24),
    .IN1(net26));
 CDRI01 max_cap25 (.Q(net25),
    .IN1(net26));
 CDRI01 max_cap26 (.Q(net26),
    .IN1(net22));
 CDRI01 wire27 (.Q(net27),
    .IN1(net28));
 CDRI01 wire28 (.Q(net28),
    .IN1(_0627_));
 CDRI01 max_cap29 (.Q(net29),
    .IN1(net30));
 CDRI01 max_cap30 (.Q(net30),
    .IN1(_0626_));
 CDRI01 max_cap31 (.Q(net31),
    .IN1(net32));
 CDRI01 max_cap32 (.Q(net32),
    .IN1(net33));
 CDRI01 wire33 (.Q(net33),
    .IN1(_0625_));
 CDRI01 wire34 (.Q(net34),
    .IN1(net35));
 CDRI01 max_cap35 (.Q(net35),
    .IN1(_0622_));
 CDRI01 max_cap36 (.Q(net36),
    .IN1(_0619_));
 CDRI01 max_cap37 (.Q(net37),
    .IN1(_0619_));
 CDRI01 max_cap38 (.Q(net38),
    .IN1(_0618_));
 CDRI01 wire39 (.Q(net39),
    .IN1(net41));
 CDRI01 max_cap40 (.Q(net40),
    .IN1(net41));
 CDRI01 wire41 (.Q(net41),
    .IN1(_0615_));
 CDRI01 wire42 (.Q(net42),
    .IN1(net43));
 CDRI01 max_cap43 (.Q(net43),
    .IN1(_0609_));
 CDRI01 wire44 (.Q(net44),
    .IN1(_0293_));
 CDRI01 wire45 (.Q(net45),
    .IN1(_0291_));
 CDRI01 max_cap46 (.Q(net46),
    .IN1(_0291_));
 CDRI01 max_cap47 (.Q(net47),
    .IN1(_0289_));
 CDRI01 max_cap48 (.Q(net48),
    .IN1(_0287_));
 CDRI01 max_cap49 (.Q(net49),
    .IN1(_0287_));
 CDRI01 max_cap50 (.Q(net50),
    .IN1(_0284_));
 CDRI01 max_cap51 (.Q(net51),
    .IN1(net52));
 CDRI01 wire52 (.Q(net52),
    .IN1(_0280_));
 CDRI01 wire53 (.Q(net53),
    .IN1(_0277_));
 CDRI01 wire54 (.Q(net54),
    .IN1(_0273_));
 CDRI01 max_cap55 (.Q(net55),
    .IN1(_0273_));
 CDRI01 wire56 (.Q(net56),
    .IN1(_0270_));
 CDRI01 max_cap57 (.Q(net57),
    .IN1(net58));
 CDRI01 max_cap58 (.Q(net58),
    .IN1(net60));
 CDRI01 max_cap59 (.Q(net59),
    .IN1(_0216_));
 CDRI01 max_cap60 (.Q(net60),
    .IN1(_0216_));
 CDRI01 max_cap61 (.Q(net61),
    .IN1(_0624_));
 CDRI01 max_cap62 (.Q(net62),
    .IN1(_0624_));
 CDRI01 max_cap63 (.Q(net63),
    .IN1(_0251_));
 CDRI01 wire64 (.Q(net64),
    .IN1(_0250_));
 CDRI01 wire65 (.Q(net65),
    .IN1(_0249_));
 CDRI01 max_cap66 (.Q(net66),
    .IN1(_0248_));
 CDRI01 wire67 (.Q(net67),
    .IN1(_0247_));
 CDRI01 wire68 (.Q(net68),
    .IN1(_0246_));
 CDRI01 wire69 (.Q(net69),
    .IN1(_0245_));
 CDRI01 wire70 (.Q(net70),
    .IN1(_0244_));
 CDRI01 wire71 (.Q(net71),
    .IN1(_0243_));
 CDRI01 wire72 (.Q(net72),
    .IN1(_0242_));
 CDRI01 wire73 (.Q(net73),
    .IN1(\u_pwm.u_pwm_core.phase [6]));
 CDRI01 wire74 (.Q(net74),
    .IN1(\u_pwm.u_pwm_core.phase [3]));
 CDRI01 max_cap75 (.Q(net75),
    .IN1(\u_pwm.u_spi.wr_toggle ));
 CDRI01 fanout76 (.Q(net76),
    .IN1(net83));
 CDRI01 wire77 (.Q(net77),
    .IN1(net80));
 CDRI01 max_cap78 (.Q(net78),
    .IN1(net80));
 CDRI01 max_cap79 (.Q(net79),
    .IN1(net76));
 CDRI01 max_cap80 (.Q(net80),
    .IN1(net76));
 CDRI01 fanout81 (.Q(net81),
    .IN1(net127));
 CDRI01 wire82 (.Q(net82),
    .IN1(net83));
 CDRI01 wire83 (.Q(net83),
    .IN1(net81));
 CDRI01 fanout84 (.Q(net84),
    .IN1(net89));
 CDRI01 wire85 (.Q(net85),
    .IN1(net84));
 CDRI01 wire86 (.Q(net86),
    .IN1(net87));
 CDRI01 max_cap87 (.Q(net87),
    .IN1(net88));
 CDRI01 max_cap88 (.Q(net88),
    .IN1(net84));
 CDRI01 fanout89 (.Q(net89),
    .IN1(net126));
 CDRI01 max_cap90 (.Q(net90),
    .IN1(net93));
 CDRI01 max_cap91 (.Q(net91),
    .IN1(net92));
 CDRI01 max_cap92 (.Q(net92),
    .IN1(net93));
 CDRI01 max_cap93 (.Q(net93),
    .IN1(net94));
 CDRI01 max_cap94 (.Q(net94),
    .IN1(net89));
 CDRI01 fanout95 (.Q(net95),
    .IN1(net100));
 CDRI01 max_cap96 (.Q(net96),
    .IN1(net97));
 CDRI01 max_cap97 (.Q(net97),
    .IN1(net99));
 CDRI01 wire98 (.Q(net98),
    .IN1(net95));
 CDRI01 max_cap99 (.Q(net99),
    .IN1(net95));
 CDRI01 fanout100 (.Q(net100),
    .IN1(net125));
 CDRI01 max_cap101 (.Q(net101),
    .IN1(net103));
 CDRI01 max_cap102 (.Q(net102),
    .IN1(net103));
 CDRI01 wire103 (.Q(net103),
    .IN1(net104));
 CDRI01 max_cap104 (.Q(net104),
    .IN1(net105));
 CDRI01 max_cap105 (.Q(net105),
    .IN1(net100));
 CDRI01 fanout106 (.Q(net106),
    .IN1(net117));
 CDRI01 wire107 (.Q(net107),
    .IN1(net109));
 CDRI01 max_cap108 (.Q(net108),
    .IN1(net109));
 CDRI01 max_cap109 (.Q(net109),
    .IN1(net110));
 CDRI01 max_cap110 (.Q(net110),
    .IN1(net106));
 CDRI01 max_cap111 (.Q(net111),
    .IN1(net106));
 CDRI01 fanout112 (.Q(net112),
    .IN1(net123));
 CDRI01 wire113 (.Q(net113),
    .IN1(net114));
 CDRI01 max_cap114 (.Q(net114),
    .IN1(net115));
 CDRI01 max_cap115 (.Q(net115),
    .IN1(net116));
 CDRI01 max_cap116 (.Q(net116),
    .IN1(net112));
 CDRI01 fanout117 (.Q(net117),
    .IN1(net126));
 CDRI01 max_cap118 (.Q(net118),
    .IN1(net120));
 CDRI01 max_cap119 (.Q(net119),
    .IN1(net120));
 CDRI01 max_cap120 (.Q(net120),
    .IN1(net121));
 CDRI01 max_cap121 (.Q(net121),
    .IN1(net122));
 CDRI01 wire122 (.Q(net122),
    .IN1(net123));
 CDRI01 max_cap123 (.Q(net123),
    .IN1(net117));
 CDRI01 wire124 (.Q(net124),
    .IN1(net125));
 CDRI01 wire125 (.Q(net125),
    .IN1(\u_pwm.u_rst_sync.rst_ff2 ));
 CDRI01 wire126 (.Q(net126),
    .IN1(net127));
 CDRI01 max_cap127 (.Q(net127),
    .IN1(\u_pwm.u_rst_sync.rst_ff2 ));
 CDRI01 max_cap128 (.Q(net128),
    .IN1(\u_pwm.u_spi.bit_cnt [3]));
 CDRI01 wire129 (.Q(net129),
    .IN1(net132));
 CDRI01 max_cap130 (.Q(net130),
    .IN1(net132));
 CDRI01 max_cap131 (.Q(net131),
    .IN1(net132));
 CDRI01 wire132 (.Q(net132),
    .IN1(net135));
 CDRI01 max_cap133 (.Q(net133),
    .IN1(net135));
 CDRI01 max_cap134 (.Q(net134),
    .IN1(net135));
 CDRI01 wire135 (.Q(net135),
    .IN1(net137));
 CDRI01 max_cap136 (.Q(net136),
    .IN1(net137));
 CDRI01 max_cap137 (.Q(net137),
    .IN1(net138));
 CDRI01 wire138 (.Q(net138),
    .IN1(net140));
 CDRI01 max_cap139 (.Q(net139),
    .IN1(net140));
 CDRI01 wire140 (.Q(net140),
    .IN1(\u_pwm.u_reg_bank.wr_data [7]));
 CDRI01 wire141 (.Q(net141),
    .IN1(net143));
 CDRI01 max_cap142 (.Q(net142),
    .IN1(net143));
 CDRI01 max_cap143 (.Q(net143),
    .IN1(\u_pwm.u_reg_bank.wr_data [7]));
 CDRI01 wire144 (.Q(net144),
    .IN1(net147));
 CDRI01 max_cap145 (.Q(net145),
    .IN1(net147));
 CDRI01 max_cap146 (.Q(net146),
    .IN1(net147));
 CDRI01 wire147 (.Q(net147),
    .IN1(net149));
 CDRI01 max_cap148 (.Q(net148),
    .IN1(net149));
 CDRI01 max_cap149 (.Q(net149),
    .IN1(net150));
 CDRI01 wire150 (.Q(net150),
    .IN1(net152));
 CDRI01 max_cap151 (.Q(net151),
    .IN1(net152));
 CDRI01 max_cap152 (.Q(net152),
    .IN1(net153));
 CDRI01 wire153 (.Q(net153),
    .IN1(\u_pwm.u_reg_bank.wr_data [6]));
 CDRI01 wire154 (.Q(net154),
    .IN1(net156));
 CDRI01 max_cap155 (.Q(net155),
    .IN1(net156));
 CDRI01 wire156 (.Q(net156),
    .IN1(net158));
 CDRI01 max_cap157 (.Q(net157),
    .IN1(net158));
 CDRI01 max_cap158 (.Q(net158),
    .IN1(\u_pwm.u_reg_bank.wr_data [6]));
 CDRI01 max_cap159 (.Q(net159),
    .IN1(net160));
 CDRI01 wire160 (.Q(net160),
    .IN1(net162));
 CDRI01 max_cap161 (.Q(net161),
    .IN1(net162));
 CDRI01 max_cap162 (.Q(net162),
    .IN1(net163));
 CDRI01 wire163 (.Q(net163),
    .IN1(net165));
 CDRI01 max_cap164 (.Q(net164),
    .IN1(net165));
 CDRI01 max_cap165 (.Q(net165),
    .IN1(net166));
 CDRI01 wire166 (.Q(net166),
    .IN1(net169));
 CDRI01 max_cap167 (.Q(net167),
    .IN1(net169));
 CDRI01 max_cap168 (.Q(net168),
    .IN1(net169));
 CDRI01 wire169 (.Q(net169),
    .IN1(\u_pwm.u_reg_bank.wr_data [5]));
 CDRI01 wire170 (.Q(net170),
    .IN1(net172));
 CDRI01 max_cap171 (.Q(net171),
    .IN1(net172));
 CDRI01 max_cap172 (.Q(net172),
    .IN1(\u_pwm.u_reg_bank.wr_data [5]));
 CDRI01 wire173 (.Q(net173),
    .IN1(net175));
 CDRI01 max_cap174 (.Q(net174),
    .IN1(net175));
 CDRI01 wire175 (.Q(net175),
    .IN1(\u_pwm.u_reg_bank.wr_data [4]));
 CDRI01 max_cap176 (.Q(net176),
    .IN1(\u_pwm.u_reg_bank.wr_data [4]));
 CDRI01 wire177 (.Q(net177),
    .IN1(net180));
 CDRI01 max_cap178 (.Q(net178),
    .IN1(net180));
 CDRI01 max_cap179 (.Q(net179),
    .IN1(net180));
 CDRI01 wire180 (.Q(net180),
    .IN1(net183));
 CDRI01 max_cap181 (.Q(net181),
    .IN1(net183));
 CDRI01 max_cap182 (.Q(net182),
    .IN1(net183));
 CDRI01 wire183 (.Q(net183),
    .IN1(net186));
 CDRI01 max_cap184 (.Q(net184),
    .IN1(net186));
 CDRI01 max_cap185 (.Q(net185),
    .IN1(net186));
 CDRI01 wire186 (.Q(net186),
    .IN1(net187));
 CDRI01 max_cap187 (.Q(net187),
    .IN1(\u_pwm.u_reg_bank.wr_data [4]));
 CDRI01 max_cap188 (.Q(net188),
    .IN1(net189));
 CDRI01 wire189 (.Q(net189),
    .IN1(\u_pwm.u_reg_bank.wr_data [3]));
 CDRI01 max_cap190 (.Q(net190),
    .IN1(net191));
 CDRI01 wire191 (.Q(net191),
    .IN1(net194));
 CDRI01 max_cap192 (.Q(net192),
    .IN1(net194));
 CDRI01 max_cap193 (.Q(net193),
    .IN1(net194));
 CDRI01 wire194 (.Q(net194),
    .IN1(net196));
 CDRI01 max_cap195 (.Q(net195),
    .IN1(net196));
 CDRI01 max_cap196 (.Q(net196),
    .IN1(net197));
 CDRI01 wire197 (.Q(net197),
    .IN1(net200));
 CDRI01 max_cap198 (.Q(net198),
    .IN1(net200));
 CDRI01 max_cap199 (.Q(net199),
    .IN1(net200));
 CDRI01 wire200 (.Q(net200),
    .IN1(\u_pwm.u_reg_bank.wr_data [3]));
 CDRI01 max_cap201 (.Q(net201),
    .IN1(net202));
 CDRI01 wire202 (.Q(net202),
    .IN1(net205));
 CDRI01 max_cap203 (.Q(net203),
    .IN1(net205));
 CDRI01 max_cap204 (.Q(net204),
    .IN1(net205));
 CDRI01 wire205 (.Q(net205),
    .IN1(net207));
 CDRI01 max_cap206 (.Q(net206),
    .IN1(net207));
 CDRI01 wire207 (.Q(net207),
    .IN1(net210));
 CDRI01 max_cap208 (.Q(net208),
    .IN1(net210));
 CDRI01 max_cap209 (.Q(net209),
    .IN1(net210));
 CDRI01 wire210 (.Q(net210),
    .IN1(\u_pwm.u_reg_bank.wr_data [2]));
 CDRI01 max_cap211 (.Q(net211),
    .IN1(net212));
 CDRI01 wire212 (.Q(net212),
    .IN1(net214));
 CDRI01 max_cap213 (.Q(net213),
    .IN1(net214));
 CDRI01 max_cap214 (.Q(net214),
    .IN1(\u_pwm.u_reg_bank.wr_data [2]));
 CDRI01 wire215 (.Q(net215),
    .IN1(net225));
 CDRI01 max_cap216 (.Q(net216),
    .IN1(net217));
 CDRI01 wire217 (.Q(net217),
    .IN1(net223));
 CDRI01 max_cap218 (.Q(net218),
    .IN1(net223));
 CDRI01 max_cap219 (.Q(net219),
    .IN1(net220));
 CDRI01 wire220 (.Q(net220),
    .IN1(net222));
 CDRI01 max_cap221 (.Q(net221),
    .IN1(net222));
 CDRI01 max_cap222 (.Q(net222),
    .IN1(net223));
 CDRI01 wire223 (.Q(net223),
    .IN1(net225));
 CDRI01 max_cap224 (.Q(net224),
    .IN1(net225));
 CDRI01 wire225 (.Q(net225),
    .IN1(\u_pwm.u_reg_bank.wr_data [1]));
 CDRI01 max_cap226 (.Q(net226),
    .IN1(\u_pwm.u_reg_bank.wr_data [1]));
 CDRI01 max_cap227 (.Q(net227),
    .IN1(\u_pwm.u_reg_bank.wr_data [1]));
 CDRI01 max_cap228 (.Q(net228),
    .IN1(net229));
 CDRI01 wire229 (.Q(net229),
    .IN1(net232));
 CDRI01 max_cap230 (.Q(net230),
    .IN1(net232));
 CDRI01 max_cap231 (.Q(net231),
    .IN1(net232));
 CDRI01 wire232 (.Q(net232),
    .IN1(net241));
 CDRI01 max_cap233 (.Q(net233),
    .IN1(net234));
 CDRI01 wire234 (.Q(net234),
    .IN1(net238));
 CDRI01 max_cap235 (.Q(net235),
    .IN1(net238));
 CDRI01 max_cap236 (.Q(net236),
    .IN1(net237));
 CDRI01 wire237 (.Q(net237),
    .IN1(net240));
 CDRI01 max_cap238 (.Q(net238),
    .IN1(net240));
 CDRI01 max_cap239 (.Q(net239),
    .IN1(net240));
 CDRI01 wire240 (.Q(net240),
    .IN1(net241));
 CDRI01 wire241 (.Q(net241),
    .IN1(\u_pwm.u_reg_bank.wr_data [0]));
 CDRI01 max_cap242 (.Q(net242),
    .IN1(\u_pwm.u_reg_bank.wr_data [0]));
 CDRI01 max_cap243 (.Q(net243),
    .IN1(\u_pwm.u_reg_bank.wr_addr [3]));
 CDRI01 max_cap244 (.Q(net244),
    .IN1(\u_pwm.u_reg_bank.wr_addr [2]));
 CDRI01 max_cap245 (.Q(net245),
    .IN1(\u_pwm.u_reg_bank.wr_addr [1]));
 CDRI01 max_cap246 (.Q(net246),
    .IN1(\u_pwm.u_reg_bank.wr_addr [0]));
 CDRI01 max_cap247 (.Q(net247),
    .IN1(\u_pwm.u_spi.shift_in [13]));
 CDRI01 max_cap248 (.Q(net248),
    .IN1(\u_pwm.u_spi.shift_in [12]));
 CDRI01 max_cap249 (.Q(net249),
    .IN1(\u_pwm.u_spi.shift_in [11]));
 CDRI01 max_cap250 (.Q(net250),
    .IN1(\u_pwm.u_spi.shift_in [10]));
 CDRI01 max_cap251 (.Q(net251),
    .IN1(\u_pwm.u_spi.shift_in [9]));
 CDRI01 max_cap252 (.Q(net252),
    .IN1(\u_pwm.u_spi.shift_in [8]));
 CDRI01 max_cap253 (.Q(net253),
    .IN1(\u_pwm.u_spi.shift_in [7]));
 CDRI01 max_cap254 (.Q(net254),
    .IN1(\u_pwm.rd_addr [6]));
 CDRI01 max_cap255 (.Q(net255),
    .IN1(\u_pwm.rd_addr [5]));
 CDRI01 max_cap256 (.Q(net256),
    .IN1(\u_pwm.rd_addr [4]));
 CDRI01 max_cap257 (.Q(net257),
    .IN1(\u_pwm.rd_addr [3]));
 CDRI01 max_cap258 (.Q(net258),
    .IN1(\u_pwm.rd_addr [2]));
 CDRI01 max_cap259 (.Q(net259),
    .IN1(\u_pwm.rd_addr [1]));
 CDRI01 max_cap260 (.Q(net260),
    .IN1(\u_pwm.rd_addr [1]));
 CDRI01 max_cap261 (.Q(net261),
    .IN1(net262));
 CDRI01 max_cap262 (.Q(net262),
    .IN1(\u_pwm.rd_addr [0]));
 CDRI01 max_cap263 (.Q(net263),
    .IN1(net264));
 CDRI01 wire264 (.Q(net264),
    .IN1(\u_pwm.duty [63]));
 CDRI01 wire265 (.Q(net265),
    .IN1(\u_pwm.duty [62]));
 CDRI01 max_cap266 (.Q(net266),
    .IN1(\u_pwm.duty [62]));
 CDRI01 max_cap267 (.Q(net267),
    .IN1(net268));
 CDRI01 wire268 (.Q(net268),
    .IN1(\u_pwm.duty [61]));
 CDRI01 max_cap269 (.Q(net269),
    .IN1(net270));
 CDRI01 wire270 (.Q(net270),
    .IN1(\u_pwm.duty [60]));
 CDRI01 max_cap271 (.Q(net271),
    .IN1(net272));
 CDRI01 wire272 (.Q(net272),
    .IN1(\u_pwm.duty [59]));
 CDRI01 max_cap273 (.Q(net273),
    .IN1(net274));
 CDRI01 wire274 (.Q(net274),
    .IN1(\u_pwm.duty [58]));
 CDRI01 max_cap275 (.Q(net275),
    .IN1(net276));
 CDRI01 wire276 (.Q(net276),
    .IN1(\u_pwm.duty [57]));
 CDRI01 max_cap277 (.Q(net277),
    .IN1(net278));
 CDRI01 wire278 (.Q(net278),
    .IN1(\u_pwm.duty [56]));
 CDRI01 max_cap279 (.Q(net279),
    .IN1(\u_pwm.duty [23]));
 CDRI01 max_cap280 (.Q(net280),
    .IN1(\u_pwm.duty [23]));
 CDRI01 max_cap281 (.Q(net281),
    .IN1(net282));
 CDRI01 wire282 (.Q(net282),
    .IN1(\u_pwm.duty [22]));
 CDRI01 max_cap283 (.Q(net283),
    .IN1(net284));
 CDRI01 wire284 (.Q(net284),
    .IN1(\u_pwm.duty [21]));
 CDRI01 max_cap285 (.Q(net285),
    .IN1(\u_pwm.duty [20]));
 CDRI01 max_cap286 (.Q(net286),
    .IN1(net287));
 CDRI01 wire287 (.Q(net287),
    .IN1(\u_pwm.duty [19]));
 CDRI01 max_cap288 (.Q(net288),
    .IN1(net289));
 CDRI01 wire289 (.Q(net289),
    .IN1(\u_pwm.duty [18]));
 CDRI01 max_cap290 (.Q(net290),
    .IN1(net291));
 CDRI01 wire291 (.Q(net291),
    .IN1(\u_pwm.duty [17]));
 CDRI01 max_cap292 (.Q(net292),
    .IN1(net293));
 CDRI01 wire293 (.Q(net293),
    .IN1(\u_pwm.duty [16]));
 CDRI01 wire294 (.Q(net294),
    .IN1(\u_pwm.duty [39]));
 CDRI01 max_cap295 (.Q(net295),
    .IN1(\u_pwm.duty [39]));
 CDRI01 max_cap296 (.Q(net296),
    .IN1(\u_pwm.duty [38]));
 CDRI01 max_cap297 (.Q(net297),
    .IN1(\u_pwm.duty [38]));
 CDRI01 max_cap298 (.Q(net298),
    .IN1(net299));
 CDRI01 wire299 (.Q(net299),
    .IN1(\u_pwm.duty [37]));
 CDRI01 wire300 (.Q(net300),
    .IN1(\u_pwm.duty [36]));
 CDRI01 max_cap301 (.Q(net301),
    .IN1(\u_pwm.duty [36]));
 CDRI01 max_cap302 (.Q(net302),
    .IN1(net303));
 CDRI01 wire303 (.Q(net303),
    .IN1(\u_pwm.duty [35]));
 CDRI01 max_cap304 (.Q(net304),
    .IN1(net305));
 CDRI01 wire305 (.Q(net305),
    .IN1(\u_pwm.duty [34]));
 CDRI01 max_cap306 (.Q(net306),
    .IN1(\u_pwm.duty [33]));
 CDRI01 max_cap307 (.Q(net307),
    .IN1(\u_pwm.duty [33]));
 CDRI01 max_cap308 (.Q(net308),
    .IN1(net309));
 CDRI01 wire309 (.Q(net309),
    .IN1(\u_pwm.duty [32]));
 CDRI01 max_cap310 (.Q(net310),
    .IN1(\u_pwm.duty [15]));
 CDRI01 max_cap311 (.Q(net311),
    .IN1(\u_pwm.duty [15]));
 CDRI01 max_cap312 (.Q(net312),
    .IN1(\u_pwm.duty [14]));
 CDRI01 max_cap313 (.Q(net313),
    .IN1(\u_pwm.duty [14]));
 CDRI01 max_cap314 (.Q(net314),
    .IN1(net315));
 CDRI01 wire315 (.Q(net315),
    .IN1(\u_pwm.duty [13]));
 CDRI01 max_cap316 (.Q(net316),
    .IN1(\u_pwm.duty [12]));
 CDRI01 max_cap317 (.Q(net317),
    .IN1(net318));
 CDRI01 wire318 (.Q(net318),
    .IN1(\u_pwm.duty [11]));
 CDRI01 max_cap319 (.Q(net319),
    .IN1(net320));
 CDRI01 wire320 (.Q(net320),
    .IN1(\u_pwm.duty [10]));
 CDRI01 wire321 (.Q(net321),
    .IN1(\u_pwm.duty [9]));
 CDRI01 max_cap322 (.Q(net322),
    .IN1(\u_pwm.duty [9]));
 CDRI01 max_cap323 (.Q(net323),
    .IN1(\u_pwm.duty [8]));
 CDRI01 max_cap324 (.Q(net324),
    .IN1(\u_pwm.duty [7]));
 CDRI01 max_cap325 (.Q(net325),
    .IN1(\u_pwm.duty [7]));
 CDRI01 wire326 (.Q(net326),
    .IN1(\u_pwm.duty [6]));
 CDRI01 max_cap327 (.Q(net327),
    .IN1(\u_pwm.duty [6]));
 CDRI01 max_cap328 (.Q(net328),
    .IN1(net329));
 CDRI01 wire329 (.Q(net329),
    .IN1(\u_pwm.duty [5]));
 CDRI01 max_cap330 (.Q(net330),
    .IN1(net331));
 CDRI01 wire331 (.Q(net331),
    .IN1(\u_pwm.duty [4]));
 CDRI01 max_cap332 (.Q(net332),
    .IN1(net333));
 CDRI01 wire333 (.Q(net333),
    .IN1(\u_pwm.duty [3]));
 CDRI01 max_cap334 (.Q(net334),
    .IN1(\u_pwm.duty [2]));
 CDRI01 wire335 (.Q(net335),
    .IN1(\u_pwm.duty [1]));
 CDRI01 max_cap336 (.Q(net336),
    .IN1(\u_pwm.duty [1]));
 CDRI01 max_cap337 (.Q(net337),
    .IN1(net338));
 CDRI01 wire338 (.Q(net338),
    .IN1(\u_pwm.duty [0]));
 CDRI01 wire339 (.Q(net339),
    .IN1(\u_pwm.duty [31]));
 CDRI01 max_cap340 (.Q(net340),
    .IN1(\u_pwm.duty [31]));
 CDRI01 wire341 (.Q(net341),
    .IN1(\u_pwm.duty [30]));
 CDRI01 max_cap342 (.Q(net342),
    .IN1(\u_pwm.duty [30]));
 CDRI01 wire343 (.Q(net343),
    .IN1(\u_pwm.duty [29]));
 CDRI01 max_cap344 (.Q(net344),
    .IN1(\u_pwm.duty [29]));
 CDRI01 max_cap345 (.Q(net345),
    .IN1(\u_pwm.duty [28]));
 CDRI01 max_cap346 (.Q(net346),
    .IN1(net347));
 CDRI01 wire347 (.Q(net347),
    .IN1(\u_pwm.duty [27]));
 CDRI01 max_cap348 (.Q(net348),
    .IN1(net349));
 CDRI01 wire349 (.Q(net349),
    .IN1(\u_pwm.duty [26]));
 CDRI01 max_cap350 (.Q(net350),
    .IN1(\u_pwm.duty [25]));
 CDRI01 max_cap351 (.Q(net351),
    .IN1(\u_pwm.duty [24]));
 CDRI01 max_cap352 (.Q(net352),
    .IN1(\u_pwm.prescaler [6]));
 CDRI01 max_cap353 (.Q(net353),
    .IN1(\u_pwm.prescaler [5]));
 CDRI01 wire354 (.Q(net354),
    .IN1(\u_pwm.prescaler [4]));
 CDRI01 max_cap355 (.Q(net355),
    .IN1(\u_pwm.prescaler [3]));
 CDRI01 max_cap356 (.Q(net356),
    .IN1(\u_pwm.prescaler [2]));
 CDRI01 max_cap357 (.Q(net357),
    .IN1(\u_pwm.prescaler [1]));
 CDRI01 max_cap358 (.Q(net358),
    .IN1(\u_pwm.prescaler [0]));
 CDRI01 max_cap359 (.Q(net359),
    .IN1(net360));
 CDRI01 wire360 (.Q(net360),
    .IN1(\u_pwm.duty [47]));
 CDRI01 max_cap361 (.Q(net361),
    .IN1(net362));
 CDRI01 wire362 (.Q(net362),
    .IN1(\u_pwm.duty [46]));
 CDRI01 max_cap363 (.Q(net363),
    .IN1(net364));
 CDRI01 wire364 (.Q(net364),
    .IN1(\u_pwm.duty [45]));
 CDRI01 max_cap365 (.Q(net365),
    .IN1(net366));
 CDRI01 wire366 (.Q(net366),
    .IN1(\u_pwm.duty [44]));
 CDRI01 max_cap367 (.Q(net367),
    .IN1(net368));
 CDRI01 wire368 (.Q(net368),
    .IN1(\u_pwm.duty [43]));
 CDRI01 max_cap369 (.Q(net369),
    .IN1(\u_pwm.duty [42]));
 CDRI01 max_cap370 (.Q(net370),
    .IN1(\u_pwm.duty [41]));
 CDRI01 max_cap371 (.Q(net371),
    .IN1(\u_pwm.duty [40]));
 CDRI01 wire372 (.Q(net372),
    .IN1(net376));
 CDRI01 max_cap373 (.Q(net373),
    .IN1(net376));
 CDRI01 wire374 (.Q(net374),
    .IN1(net375));
 CDRI01 max_cap375 (.Q(net375),
    .IN1(\u_pwm.pwm_en ));
 CDRI01 max_cap376 (.Q(net376),
    .IN1(\u_pwm.pwm_en ));
 CDRI01 max_cap377 (.Q(net377),
    .IN1(\u_pwm.u_pwm_core.duty_active [63]));
 CDRI01 max_cap378 (.Q(net378),
    .IN1(\u_pwm.u_pwm_core.duty_active [61]));
 CDRI01 max_cap379 (.Q(net379),
    .IN1(\u_pwm.u_pwm_core.duty_active [60]));
 CDRI01 max_cap380 (.Q(net380),
    .IN1(\u_pwm.u_pwm_core.duty_active [59]));
 CDRI01 max_cap381 (.Q(net381),
    .IN1(\u_pwm.u_pwm_core.duty_active [58]));
 CDRI01 max_cap382 (.Q(net382),
    .IN1(\u_pwm.u_pwm_core.duty_active [55]));
 CDRI01 max_cap383 (.Q(net383),
    .IN1(\u_pwm.u_pwm_core.duty_active [54]));
 CDRI01 max_cap384 (.Q(net384),
    .IN1(\u_pwm.u_pwm_core.duty_active [53]));
 CDRI01 max_cap385 (.Q(net385),
    .IN1(\u_pwm.u_pwm_core.duty_active [52]));
 CDRI01 wire386 (.Q(net386),
    .IN1(\u_pwm.u_pwm_core.duty_active [50]));
 CDRI01 wire387 (.Q(net387),
    .IN1(\u_pwm.u_pwm_core.duty_active [48]));
 CDRI01 max_cap388 (.Q(net388),
    .IN1(\u_pwm.u_pwm_core.duty_active [47]));
 CDRI01 max_cap389 (.Q(net389),
    .IN1(\u_pwm.u_pwm_core.duty_active [45]));
 CDRI01 max_cap390 (.Q(net390),
    .IN1(\u_pwm.u_pwm_core.duty_active [44]));
 CDRI01 max_cap391 (.Q(net391),
    .IN1(\u_pwm.u_pwm_core.duty_active [43]));
 CDRI01 max_cap392 (.Q(net392),
    .IN1(\u_pwm.u_pwm_core.duty_active [42]));
 CDRI01 max_cap393 (.Q(net393),
    .IN1(\u_pwm.u_pwm_core.duty_active [41]));
 CDRI01 max_cap394 (.Q(net394),
    .IN1(\u_pwm.u_pwm_core.duty_active [39]));
 CDRI01 max_cap395 (.Q(net395),
    .IN1(\u_pwm.u_pwm_core.duty_active [38]));
 CDRI01 max_cap396 (.Q(net396),
    .IN1(\u_pwm.u_pwm_core.duty_active [37]));
 CDRI01 max_cap397 (.Q(net397),
    .IN1(\u_pwm.u_pwm_core.duty_active [36]));
 CDRI01 max_cap398 (.Q(net398),
    .IN1(\u_pwm.u_pwm_core.duty_active [35]));
 CDRI01 max_cap399 (.Q(net399),
    .IN1(\u_pwm.u_pwm_core.duty_active [34]));
 CDRI01 max_cap400 (.Q(net400),
    .IN1(\u_pwm.u_pwm_core.duty_active [33]));
 CDRI01 max_cap401 (.Q(net401),
    .IN1(\u_pwm.u_pwm_core.duty_active [31]));
 CDRI01 max_cap402 (.Q(net402),
    .IN1(\u_pwm.u_pwm_core.duty_active [30]));
 CDRI01 max_cap403 (.Q(net403),
    .IN1(\u_pwm.u_pwm_core.duty_active [29]));
 CDRI01 max_cap404 (.Q(net404),
    .IN1(\u_pwm.u_pwm_core.duty_active [28]));
 CDRI01 max_cap405 (.Q(net405),
    .IN1(\u_pwm.u_pwm_core.duty_active [27]));
 CDRI01 max_cap406 (.Q(net406),
    .IN1(\u_pwm.u_pwm_core.duty_active [26]));
 CDRI01 max_cap407 (.Q(net407),
    .IN1(\u_pwm.u_pwm_core.duty_active [25]));
 CDRI01 max_cap408 (.Q(net408),
    .IN1(\u_pwm.u_pwm_core.duty_active [23]));
 CDRI01 max_cap409 (.Q(net409),
    .IN1(\u_pwm.u_pwm_core.duty_active [22]));
 CDRI01 max_cap410 (.Q(net410),
    .IN1(\u_pwm.u_pwm_core.duty_active [21]));
 CDRI01 max_cap411 (.Q(net411),
    .IN1(\u_pwm.u_pwm_core.duty_active [20]));
 CDRI01 max_cap412 (.Q(net412),
    .IN1(\u_pwm.u_pwm_core.duty_active [18]));
 CDRI01 max_cap413 (.Q(net413),
    .IN1(\u_pwm.u_pwm_core.duty_active [17]));
 CDRI01 max_cap414 (.Q(net414),
    .IN1(\u_pwm.u_pwm_core.duty_active [15]));
 CDRI01 max_cap415 (.Q(net415),
    .IN1(\u_pwm.u_pwm_core.duty_active [14]));
 CDRI01 max_cap416 (.Q(net416),
    .IN1(\u_pwm.u_pwm_core.duty_active [13]));
 CDRI01 max_cap417 (.Q(net417),
    .IN1(\u_pwm.u_pwm_core.duty_active [12]));
 CDRI01 max_cap418 (.Q(net418),
    .IN1(\u_pwm.u_pwm_core.duty_active [11]));
 CDRI01 max_cap419 (.Q(net419),
    .IN1(\u_pwm.u_pwm_core.duty_active [10]));
 CDRI01 max_cap420 (.Q(net420),
    .IN1(\u_pwm.u_pwm_core.duty_active [9]));
 CDRI01 max_cap421 (.Q(net421),
    .IN1(\u_pwm.u_pwm_core.duty_active [7]));
 CDRI01 max_cap422 (.Q(net422),
    .IN1(\u_pwm.u_pwm_core.duty_active [6]));
 CDRI01 max_cap423 (.Q(net423),
    .IN1(\u_pwm.u_pwm_core.duty_active [5]));
 CDRI01 max_cap424 (.Q(net424),
    .IN1(\u_pwm.u_pwm_core.duty_active [4]));
 CDRI01 max_cap425 (.Q(net425),
    .IN1(\u_pwm.u_pwm_core.duty_active [3]));
 CDRI01 max_cap426 (.Q(net426),
    .IN1(\u_pwm.u_pwm_core.duty_active [2]));
 CDRI01 max_cap427 (.Q(net427),
    .IN1(\u_pwm.u_pwm_core.duty_active [1]));
 CDRI01 wire428 (.Q(net428),
    .IN1(\u_pwm.duty [55]));
 CDRI01 max_cap429 (.Q(net429),
    .IN1(\u_pwm.duty [55]));
 CDRI01 max_cap430 (.Q(net430),
    .IN1(net431));
 CDRI01 wire431 (.Q(net431),
    .IN1(\u_pwm.duty [54]));
 CDRI01 max_cap432 (.Q(net432),
    .IN1(net433));
 CDRI01 wire433 (.Q(net433),
    .IN1(\u_pwm.duty [53]));
 CDRI01 max_cap434 (.Q(net434),
    .IN1(net435));
 CDRI01 wire435 (.Q(net435),
    .IN1(\u_pwm.duty [52]));
 CDRI01 max_cap436 (.Q(net436),
    .IN1(net437));
 CDRI01 wire437 (.Q(net437),
    .IN1(\u_pwm.duty [51]));
 CDRI01 max_cap438 (.Q(net438),
    .IN1(net439));
 CDRI01 wire439 (.Q(net439),
    .IN1(\u_pwm.duty [50]));
 CDRI01 max_cap440 (.Q(net440),
    .IN1(net441));
 CDRI01 wire441 (.Q(net441),
    .IN1(\u_pwm.duty [49]));
 CDRI01 max_cap442 (.Q(net442),
    .IN1(net443));
 CDRI01 wire443 (.Q(net443),
    .IN1(\u_pwm.duty [48]));
 CDRI01 fanout444 (.Q(net444),
    .IN1(_0231_));
 CDRI01 wire445 (.Q(net445),
    .IN1(net446));
 CDRI01 max_cap446 (.Q(net446),
    .IN1(net444));
 CDRI01 max_cap447 (.Q(net447),
    .IN1(net444));
 CDRI01 max_cap448 (.Q(net448),
    .IN1(_0231_));
 CDRI01 clkbuf_0_clk (.Q(clknet_0_clk),
    .IN1(clk));
 CDRI01 clkbuf_4_0_0_clk (.Q(clknet_4_0_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_1_0_clk (.Q(clknet_4_1_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_2_0_clk (.Q(clknet_4_2_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_3_0_clk (.Q(clknet_4_3_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_4_0_clk (.Q(clknet_4_4_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_5_0_clk (.Q(clknet_4_5_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_6_0_clk (.Q(clknet_4_6_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_7_0_clk (.Q(clknet_4_7_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_8_0_clk (.Q(clknet_4_8_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_9_0_clk (.Q(clknet_4_9_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_10_0_clk (.Q(clknet_4_10_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_11_0_clk (.Q(clknet_4_11_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_12_0_clk (.Q(clknet_4_12_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_13_0_clk (.Q(clknet_4_13_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_14_0_clk (.Q(clknet_4_14_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_4_15_0_clk (.Q(clknet_4_15_0_clk),
    .IN1(clknet_0_clk));
 CDRI01 clkbuf_0_sclk (.Q(clknet_0_sclk),
    .IN1(sclk));
 CDRI01 clkbuf_2_0__f_sclk (.Q(clknet_2_0__leaf_sclk),
    .IN1(clknet_0_sclk));
 CDRI01 clkbuf_2_1__f_sclk (.Q(clknet_2_1__leaf_sclk),
    .IN1(clknet_0_sclk));
 CDRI01 clkbuf_2_2__f_sclk (.Q(clknet_2_2__leaf_sclk),
    .IN1(clknet_0_sclk));
 CDRI01 clkbuf_2_3__f_sclk (.Q(clknet_2_3__leaf_sclk),
    .IN1(clknet_0_sclk));
endmodule
