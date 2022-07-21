import 'package:google_maps_flutter/google_maps_flutter.dart';

class Locais {
  static List items = [
    {
      "locais": [
        {
          "title": "Estação São Caetano do Sul",
          "lat": -23.6101473,
          "long": -46.570537,
          "bounds": {
            "northeast": {"lat": -23.6100111, "lng": -46.5297879},
            "southwest": {"lat": -23.6683112, "lng": -46.5723664}
          },
          "markerId": "SCS",
          "snippet": "São Caetano do Sul/Brasil",
          "polyline":
              "ruioCnqg{Gs@_@GNMl@IXAZIpBB^a@BQ?_A[eBi@yBk@mG}A]Sa@ScBi@iAa@y@Iy@JcDh@wAVWDYA]I_EaBmAk@GC?_A?qDCuE?iEA}AHeBsEDyB?o@?UGYOo@IiAEmKHoLNwG@mZFoWFoRFySDyRDqB@a@BQ@_E?q@@Q@SHIHQh@g@lB",
          "hue": BitmapDescriptor.hueBlue
        },
        {
          "title": "Allianz Parque",
          "lat": -23.5275012,
          "long": -46.6787823,
          "bounds": {
            "northeast": {"lat": -23.5162544, "lng": -46.5256771},
            "southwest": {"lat": -23.6683112, "lng": -46.680193}
          },
          "markerId": "PAL",
          "snippet": "São Paulo/Brasil",
          "polyline":
              "ruioCnqg{Gs@_@GNMl@IXAZIpBDn@YPUTQXQn@Kd@OjAMh@q@hAeMvLiBdBsAnAcBvBg@p@iApBOZi@~@QXG?WXYZy@l@y@^gB`@OLsKlBeM~Bw@Ju@Dw@?c@EgAUYKu@[q@g@Y[i@q@]i@yA}BsAyBQSm@a@YKcAUaDi@cG_AqB]_@GOI_@I_@Am@?iAJ_@Fk@Vc@\\{@~@aAdAQL}@b@s@Jk@?yCYqMqAiBOaBIsBMoC_@_Iu@uHw@}I}@uMsAa@K{@q@e@WOC_Dc@e@A_@LgAXaAH_@@aKcAuC[e@LWBIR_@T_A\\YPmAp@oGhDo@^g@VYNuGdEuCnBiA`AEHoGdFwIdHqWzSeN~K_IlGeGzEqAx@kDnBoCfB{CnAqW~JcFlBKFpAdEDVCNOTuEI{CEo@@w@Ho@JoA`@qBp@qBx@uBbA{Ar@yBlA}@l@{AjAuAlAqBjBkBhBeA~@k@\\cAX_ALyDNsANs@Ps@Zq@h@s@x@wBfEsEfJe@`AiA|B]b@c@^e@XcChAqFbCoFdCo@\\URINWNgHbD}GzCgBz@kAr@iAz@yAxAq@z@cA`BaAvBq@pB}GvZkAnFo@tBc@hAo@tAy@xAsAhBmAtA_@\\yAjAuCnBiAXgBRqA\\u@ToEtAc@Ng@JkC~@iD`BwCbBaDrAgBf@a@F}Cd@gBP]B_BDeBAy@EI@w@GaC[wA]iE}AgFaB{CiAmGuB_Cw@qHmCqCcAw@UgAQkBKgAAg@@gAN[Hw@TMNyBz@YNqAl@qAf@aC`ASLyEnBwClAwN~FyAl@a@RYVQXm@hByAlCm@lAcBtCeGtJcHvKwArBa@b@qAhAgFzD{AhAONOXS\\Uv@IhAAfAMrFEbCAxAIfCEt@W`EeAhP]jH[dG]nDg@dHUfCU|E]|EIfAMh@]zDMdBC`@KTIZE\\U`BYvBGn@EHCDEh@M~AO~Am@|KYhEM~@YlGYxHW~DATYP[NSBUC[I[OMSEWF[TQ`@I~ALdHh@bCRn@H|BV`CNxALvE^xCTXHd@Zb@Zd@T@BBFBDVRZJN@L?DCDFFBRBh@?d@JFBbA|@hQlOtF|Er@~@lAtB`BxCh@|A`@`AfBbDZf@`BbCv@jABXDZGl@ANK~@Uv@iAdCkA|B",
          "hue": BitmapDescriptor.hueGreen
        },
        {
          "title": "Centro Universitário FEI",
          "lat": -23.7242191,
          "long": -46.5794683,
          "bounds": {
            "northeast": {"lat": -23.6662843, "lng": -46.5313283},
            "southwest": {"lat": -23.725256, "lng": -46.5794757}
          },
          "markerId": "FEI",
          "snippet": "São Bernardo do Campo/Brasil",
          "polyline":
              "ruioCnqg{Gs@_@GNMl@IXAZIpBDn@YPUTQXQn@I\\JNHJHDNHh@LlCTRDNJfBvBd@r@@F@FJ\\?VCRi@f@{@x@[d@M^GZAXVxORzK@pAAjA?PObAy@xBu@fBKZKf@@H?P?PDTDJF@P?HCFEBQF]Ni@nAuCPi@XiAJg@@c@QkAFc@HKLK|A[tBc@d@Od@]NWD]Gg@KWaAkA}@kAOYEYAc@Da@L_@PUTUhDaBdD}ApDyArDcBzBgAhD_BvHqD|Am@v@WrC{@~C_A`H}BvP}EjGmBxKkD~Ac@hJ{CnFkBzG{BlA_@hA[nHkB~HmB|JgCfFiAdJuBlFmAnBi@rDaAzJ_CdDy@bEmA|Ac@vHaBhCq@jBg@b@Od@OjB[pCg@nA[bDs@lA_@vG{AzDaAjEiAxEiA|DaAbE_AjCa@tDW|AInC?xIBjR?zC?|DA~AChDBrEBnBClCDdEB|AGtAEx@OfB]`Bm@`@OxAu@zAgAd@QFE`@Y~@}@pBwBNIJANDLH^Xt@f@XV`@h@Vl@Vt@Nb@b@hBnB|Gz@dCj@hAfBhEpAbDh@dBvAfInAxH\\vARd@~@zArA~Al@`AZp@d@pAVbAVbBLvB@^CVO^W^IRc@d@Sv@Er@B\\DXN^TXRP\\f@NTBJGbBIjC@dC@d@LxBAXM|AO~AGPP@LH",
          "hue": BitmapDescriptor.hueCyan
        },
        {
          "title": "Belo Horizonte",
          "lat": -19.8775602,
          "long": -43.9578387,
          "bounds": {
            "northeast": {"lat": -19.8776697, "lng": -43.9577055},
            "southwest": {"lat": -23.6683112, "lng": -46.5991704}
          },
          "markerId": "BH",
          "snippet": "Belo Horizonte/Brasil",
          "polyline":
              "ruioCnqg{Gem@rv@kmAwLu_DeYg_Bxn@c`@wmAyoHhfA{gAtAo{BwbCu|CsMqz@hdAogBwJ{uBnAchBteAu}A__@wlAwdAwx@uEex@mgAyuBxLgK`z@qzBzwA{k@lX}fAaV{u@cj@kj@jL{Oze@xC|ZmUv_@ksA}\\w}Bh{@shAvRmjAdFslDm}@eiEiqAkcFfBoqDsp@uxCdG}oAYkpAuE_|A}kAo~BkqDmiDwxB{wBodCydEmqAgiAgqAci@{{BabBynB}fCqpAca@eoAvS}sAmhAk_D{jAm}BwuBuw@as@mpAw~BstE{GedBox@mp@eo@seAskByi@}s@qdBbQegBrNurAoYguAo`AkaD{u@c{AokCo`@a{CoiBypCqkBesBq{@elDs~@uuIo~E{iGmz@qiBehA}qAkg@aqG{]siFopGyiAes@}a@lWm~EisDe_FmuAgu@m~@ebC}p@ohHkmAadIugDcgAe{A_lC{bAgpCkgBeyAauAi{@}hDkj@soDs`Bw{D_eBmqBodBxFmiCk{AqhAmhAajBpQkjCwr@y{AkuDecA_cAenBqj@_gDegAw{@ybF}\\syAquBgxAapCykAssAkwAazAku@ql@iwA_qB_p@yz@{jB{eAisCwfCc}CgnBk|DakBefA{yBu_@{kB}_Agn@wjBi`ByfAmv@chDkdBmbA}yEutFlVie@_OsnAafE{LavB~[mkBoPy|Hu|D_~Bsq@y{Brs@umDoAg{C]klAicBo`Ccd@q|@vNwq@w~@ikB_f@{zAew@gr@Hae@ar@wsBs}Ae}Bi]kzDcLwtHktBqbBv|@kfBqqAgkG{}BesEqwE_i@{h@{uAwYwZ}oDyNwkBqbCoAsdF_kGkyAiiBgdBgnA{m@knB|R}y@yd@u~@efA{zAi_C{n@iaHk|Cu~D{eB_gAe^mV_fBg_AqfAklBk\\yzD{o@}dGg_AirFexDimI}h@qyBtC{y@{dAivA{nCo_C{jCowCacCgeAotBi`BetAscAutAkuDguCoeDkuBizAai@unA_rBmpB_uB{y@kxByoAkcBmtAs~B{~Ai_Acj@qvAuaAaUqbBt~Aw}BqhAwxDiwBqxCawAo}@wFqh@}dAalCuu@shE_uAwmAemAeRigCzd@ex@qq@yTy_Asa@asBw_CeaAqFm_A|dA|FplAib@_]sqGstDgyBenDgw@mvCkoA{dAyyEkaD{}Bo|Dks@q{CvCujCdPucGiD{pDvRa`BgaA}mCqQ_r@c~ByHkuDe{C}~Ba~DiDrh@",
          "hue": BitmapDescriptor.hueYellow
        },
        {
          "title": "Shopping ABC",
          "lat": -23.6678952,
          "long": -46.5333976,
          "bounds": {
            "northeast": {"lat": -23.6468612, "lng": -46.5297879},
            "southwest": {"lat": -23.6683112, "lng": -46.5766909}
          },
          "markerId": "SA",
          "snippet": "Santo André/Brasil",
          "polyline":
              "ruioCnqg{Gs@_@GNMl@IXAZIpBDn@YPUTQXQn@I\\JNHJHDNHVF^e@~@gAb@_@b@WfB{@TQ`DcCv@k@l@o@f@y@Tw@Jg@Du@Am@G]KUYa@qC{CUa@Uw@Oq@Aa@Aw@D_@x@cFfA_Gn@yDbAcG\\}Ab@iA\\m@NWRQp@s@|AyA~@{@d@]^U`A}@v@k@t@eAb@g@BINMX]Xy@f@eBXm@n@u@t@s@FOX{Bb@cELcABCXsBFk@PmA`AyFJcBCIL{BDUFYNWTU\\WRID@@?fAc@dFsCtDoBtAo@VE\\AXBj@TDHFDRBPGHO@IPIZw@Ts@@S|BqFl@sALa@DYD[DiAHQVeCl@iHBc@Aw@Qo@oEyHa@{@Uy@COGu@?Y@W?GBaADqDKsAKe@Qo@_@u@eB{CmBuDaEaH_EcHs@}A_A{Ca@yA[iAQiAa@_Bi@}Bg@eBGQ?QD[HMNM^SfCoANQt@g@dAs@bBs@hAg@pDwA|BeAf@GjALbFn@|@N~Aj@lDvBfD`Bv@V~Cn@bHrAx@JfB^~APf@Jj@T`@X",
          "hue": BitmapDescriptor.hueRed
        }
      ]
    }
  ];
}
