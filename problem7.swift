
import Foundation

/**
Wandering further through the circuits of the computer, you come upon a tower of programs that have gotten themselves into a bit of trouble. A recursive algorithm has gotten out of hand, and now they're balanced precariously in a large tower.

One program at the bottom supports the entire tower. It's holding a large disc, and on the disc are balanced several more sub-towers. At the bottom of these sub-towers, standing on the bottom disc, are other programs, each holding their own disc, and so on. At the very tops of these sub-sub-sub-...-towers, many programs stand simply keeping the disc below them balanced but with no disc of their own.

You offer to help, but first you need to understand the structure of these towers. You ask each program to yell out their name, their weight, and (if they're holding a disc) the names of the programs immediately above them balancing on that disc. You write this information down (your puzzle input). Unfortunately, in their panic, they don't do this in an orderly fashion; by the time you're done, you're not sure which program gave which information.

For example, if your list is the following:

pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
...then you would be able to recreate the structure of the towers that looks like this:

					  gyxo
					/     
			  ugml - ebii
			 /      \     
			|         jptl
			|        
			|       pbga
		 /        /
tknk --- padx - havc
		 \        \
           |        qoyq
		   |             
			|         ktlj
			 \      /     
			    fwft - cntj
				    \     
					 xhth
In this example, tknk is at the bottom of the tower (the bottom program), and is holding up ugml, padx, and fwft. Those programs are, in turn, holding up other programs; in this example, none of those programs are holding up any other programs, and are all the tops of their own towers. (The actual tower balancing in front of you is much larger.)

Before you're ready to help them, you need to make sure your information is correct. What is the name of the bottom program?

*/



let input = """
nzyiue (57)
pdmkag (39)
bogbg (13)
nubay (45)
dukzh (17)
kpjxln (44) -> dzzbvkv, gzdxgvj, wsocb, jidxg
cxjyxl (83)
vusplt (151) -> mcfst, orrwx
mxrfq (98)
bdoez (62)
vrajpg (78)
qzsowpu (90)
nrxoha (51)
xtjrkv (351) -> jlbhafs, pyocxtt
rlnii (18986) -> xjosf, ljvpv, wkumzkr
ddrrgp (23)
wladmn (42)
ryskzh (209) -> wsyya, xbqpjo
jbjkp (34)
fnfiur (86)
zxzkl (82)
hbmxey (1869) -> khkuxc, mjuwde, tztycfl, miauii
zjyqcfa (97)
zbtck (48)
mgsasl (39)
cemygp (34)
iolrkmv (139) -> rntjx, itxtmhb
jzmqzl (1446) -> pptocz, mwfryd, utgkveb, sflwom
wagpkyw (88)
saiyjff (67)
kwwhb (219) -> htvpmr, rojhup
huspq (74)
mzrafi (44)
fchlc (89)
ezkddph (62)
zehnmg (5)
tgirh (50)
xantdh (73)
zicvvl (10)
kcimi (86) -> uwizfa, kmhyz, wagpkyw, iuovz
wsocb (64)
aemffo (284) -> dukzh, vczudlu, tpubu
gfgoc (18)
bmovg (80)
trsnrjd (89) -> oujkd, fstzdn
bmqiwai (12928) -> yqeaqcn, cgzyc, bwgkn, giftd, hdhvzi
ktehtif (151) -> fvplhrm, jesphm
jkfyg (76) -> ajeisgv, jfrooen, hvhtokr
dkfepj (1970) -> tgirh, mnsqjxv
jjseenh (99)
jvpecm (7) -> dpyuayl, lyigbhi, bflxonp, tvcyh, tddik
silklk (59)
swscfel (68)
dilefzx (89)
spthyf (75)
tiiwbg (17)
ayqgp (58)
qhygx (14)
hqccsb (26) -> bdkfx, srrxb
lbojqfo (34)
arbebt (32)
fsvkj (115) -> ftqtzxk, twzgms, otvvje
sdigtox (39)
awsphe (79)
lftlc (35)
apzabs (68)
aboilvw (452)
rntylx (44)
xhhfsuw (280)
yucwtc (41)
qlgkqk (54) -> sqfrw, acdkw, ycinfxk, wcinck, hyfswg
thneyz (57)
pplkoa (79)
vsxzpf (197) -> spyxh, yvcbk, fkmccg
miymiit (1002) -> lmmeg, jxulvx, yqergs
jaamgi (45)
tvwosmc (1462) -> frvmu, qmfmfxh, jemmk
ngemsu (85)
ohiftl (143) -> loggp, xhwfcu
bztor (157) -> gjfkx, grsdifs, spchmoq
tifkr (52)
kgctcau (82)
yvcbk (32)
srvwd (1234) -> dxerl, pzjsf, yqyyoj
xrise (358)
biwdu (70) -> kvpju, hlullj, bfpvsfz, fvfitqc
utgkveb (76) -> fmhjs, pplkoa, mznkfco
mvhqou (22) -> njgzn, okfcek, zjyqcfa, culvtcm
gadyi (398) -> ndxim, efwhif
ujzofuy (39)
jjgem (852) -> hnvybq, gnffzh, fbuklc
rbucosf (122) -> jvpgl, yuhioxl
ffxnegs (222) -> zfcylzq, xjxjaq, cocau, vusplt, cjlxgf, yjonn, iazte
wrtyhxg (403) -> zqckoxe, vindf, jbvugg, idivffq
imbpvgl (52)
frrvvai (193) -> gxcnp, zvjrwke
ywlrls (31) -> gqdxrur, dfyqo, cxndroi, gbpcav
olzdhtj (42)
thvjlgo (76) -> cufudi, jdyspx
jearhat (57)
jxanwhq (27)
wsyya (98)
tahstqe (37)
dyvooj (80)
yuypmb (98)
uehdbi (26)
inspqeu (34)
nxqqsza (119) -> guxwd, iyxkzat
jgkmy (86)
hllzej (154) -> sodrm, ekfpabq, utqxb
gcbvf (68)
ctoxz (98)
advlxrg (22)
eetxll (37)
lmpauyz (72)
lwxts (76)
rkuyxrc (55)
pitdti (55)
ucjew (91)
gynwftf (91)
czojwyg (15)
uigoxw (75)
rcjqfuo (129) -> lgoak, zcomcn
vvkbav (56)
npcyutn (35)
jfaoy (57)
iqcgwzk (58) -> pdepl, zxeopkg, dukqd, gxdtiob, ylnvdoq
rqnsxm (2056) -> jaxig, bolxwme, dgsse
bsyiv (38)
hhnpg (164) -> dmvajb, pvwdkm
oydoajo (87)
fowpeur (85)
ycnih (17)
zwpyj (12)
wpprf (97) -> fdthu, sxslizl
icqsww (55)
ckedyqu (54)
ageyuq (19)
ebrgtq (112) -> bochc, wqdvql, ogafygg
ygteuy (89)
tuhxr (76)
rvuvico (91)
ecjujqu (92)
tvhgbau (79)
zvsnz (26)
fquywyi (308)
gqrgh (24)
zcfswa (37)
hkbxj (55)
cnknlru (70) -> udfuty, sawqp
jljnags (38)
tztycfl (939) -> rrtqyew, gqzemw, hsfxq
xzyri (187) -> yakzm, zkikhk
sdzoy (51)
ojtrl (130) -> hpgktb, pjkwlmk, phkvcix, zguqo
lyhok (95) -> hdpemqh, nfvsrpa, bwthm, bilzbf, nrlvovz, iqcgwzk, sljgt
hpanc (17)
ykvtr (51)
qbbmsf (97)
ppfyonm (98) -> ylwniqh, ecjrblb
jdsdqzd (32)
oujkd (97)
dpija (23)
pdjnnzd (85)
ghzqyv (37)
yvlxoom (58) -> yxoqwg, wgwkss
gjupqe (180) -> oszyw, zyqqzou
qmfmfxh (7) -> rkgxu, unrhnl
hxlefwp (268) -> yablonq, ouxjkf
fdthu (86)
voonmio (63)
uxlcvt (143) -> scipnb, veutu
xybcccw (7)
inomnjg (91)
gfuxooq (221) -> aceiy, axtzeb
xirqz (71)
tuqzsn (73) -> hueqfk, hcyohc, nerlvh
jaxig (82) -> llofnny, snvqyqb
czztmlk (61)
ffrilz (148) -> qnvzqc, ckedyqu
ejslpy (5616) -> wwcih, jzdmjdf, gnrqrsj, ayirpk, kvifa, bapvub
bfwbkxq (493) -> hiqhe, ouqwmnj, wqxcn, jkfyg
upftju (48)
bqcizg (67)
mkyqul (5)
wjjar (296) -> ywutc, nsvrfae
pabgfh (244) -> bogbg, hgcxyx, siisskc
oltky (7)
aeapmwq (76)
btjxv (35) -> wpgyc, ripmztc
onuxzz (247)
ahayh (54732) -> byrvfhp, rokie, ejslpy
idooz (192) -> owxuzp, uehdbi
ghjpcv (162) -> xucdiz, ygrbgm, yxqesmi, ebktv
zhffrzu (42)
bpygf (26)
tojpm (42)
iihzs (67) -> hkbxj, enekg
ydpihb (46)
rgssc (27)
dkgsvl (82)
qrfhxne (65)
sntuz (68)
oznhe (98) -> tgvdjhh, cpvlq
evfqyvl (304)
qftqq (27)
yxcbn (11)
buifcn (15)
xbpqmua (25)
vjroix (85)
evqrr (48)
unrhnl (88)
ihuzl (35)
giftd (1250) -> zbedu, vyaoad, qcolnc
uqjmbb (17)
egulpbe (80)
fpmwz (218)
nihmyu (98)
avaoo (176) -> xxshup, xsufhnb
fmqon (61)
mbokr (57)
gprznw (41)
bflxonp (105) -> pdmsm, jearhat
oylgfzb (65) -> rugzyaj, hbgyu, rlnii, gwznzk, bmqiwai
cepqh (19)
hfjhadi (58)
ajtkddh (60)
vyadxnv (94) -> pyntdrr, mdpcfvu, cbvjwlo, ijleirw, sltrdk, adueu, qlkqplv
anvvug (1847) -> tfuxhhz, kgctcau
tjobe (129) -> hdspavt, mcduq
qvgeei (273)
dkxsqjt (1416) -> cuwqi, fcoxtp, yvlxoom
urwgjd (39)
vxqcf (105) -> gfnapwr, lmpauyz
etnkepp (5)
koyke (15)
qqhjlu (78)
glguoq (75)
hdvfyp (7) -> eoaprcr, cksyln, hknzmvs
pqvid (15)
jesphm (6)
bdkfx (81)
gqdxrur (77)
fmifd (94)
ijiqjtf (63)
dfyqo (77)
spchmoq (31)
tvcyh (149) -> lqbtnb, matcdld
ilzwrk (64)
tdtznh (64) -> phacwjs, offas
tygst (91)
uzjoys (198) -> bgcjrf, zdrfiw
wfbuzbg (47) -> qpuyqq, ajrcal
kwqcbe (19)
qdovgra (303) -> zziyhz, gfgoc
vfcbliu (19)
fwtfkp (325)
rmdqvgh (61)
dtjzr (28)
cocau (77) -> ficmghd, nkejtw, qowyx
aftsom (70)
fsmzljm (123) -> tatjry, hnfeims
lwufmc (45)
fzzcxvm (61)
cxokosi (70) -> sszzop, gatdr
mmlra (32) -> wdlwryo, wpprf, jexreg, lzowumq, rcjqfuo, lhnevgo, smuybnw
tydlqpq (160) -> fsbojm, mjlmuca
oevvote (68) -> silklk, polrzc, erysec, xoyjtol
fxsatsm (83) -> sntuz, qgxcbt
cvvtz (80) -> vpjhl, rgssc
feonsg (74)
htvpmr (7)
gqzemw (43) -> pxdgkik, jtvntr
pvpqoq (17)
ldfmurk (88) -> fubtwbq, ycawl, sqsqge, aemffo, mszwp
aufym (51)
ldflo (188)
izyjved (5)
zgydn (72)
cqfri (9)
ytnti (150) -> lamtp, fugeht
appkqpe (95)
sjxbk (117) -> tinbqcj, amwtic
fbvvrqt (81)
vlwjehz (22)
lwhev (44) -> zesvlul, wmwzhjg, hpjgrb, sxbusu
hugfkt (42)
tnobvt (18)
zesvlul (73)
gfnapwr (72)
tabzzo (62) -> rvuvico, inomnjg
ixdcgsa (177) -> gmhxee, cogovv
fnvgp (85)
awhwxdm (91)
frgot (59)
boete (78) -> ionnnfx, vytdgko, ouhfxyf
ikxewmm (14)
qfkka (49)
xidye (11)
krdlzf (115)
hxjhcuc (694) -> miuvc, iolrkmv, trsnrjd
ikbkb (136) -> uigoxw, spthyf
yqeaqcn (53) -> qysdgq, mkjvhl, evfqyvl, bhzbv, usuujhq, hxlefwp
dnrxyh (887) -> xthhlfy, fxsatsm, cqpns, xzyri
siswh (41)
pfxrf (51)
dlzgufq (7462) -> ldfmurk, dnrxyh, dzetsz
whlfwr (46)
gbiluq (11)
euaceg (42)
iwdesog (152) -> cqyluwl, dbeskg
afjmzb (15)
sofxmjx (83)
ortcrq (18)
phacwjs (58)
uiwgpi (995) -> hqvvrd, caihc, rvxed
oiyxr (86) -> zibbm, sbklnq
yukoxaw (27)
orrwx (47)
tlxbtng (44)
ayirpk (1850) -> cdkcn, wbllfh, xounvb
lqjznss (67)
mldkiku (55)
dyfhy (58)
jxulvx (34) -> ujzjt, ykmej
yuhioxl (20)
uwiza (106) -> lddiw, hxaza, bnvjmae, oltky
hpsxqdm (41) -> luzcpkn, azdklp, rupdbwl, vwqog
fubtwbq (211) -> bdoez, ezkddph
cwgbjaq (41)
kmhyz (88)
tpubu (17)
bfrbwb (27)
mgwauar (8)
ixwyi (13)
ljugvh (7) -> nxrkz, gnwjseo, ibjbozh, iaiywwa, pcdtne, nvtbk, vobfi
rcongvf (20)
csqyn (46)
ygbyt (15)
gwznzk (11) -> ehqavsc, yimottm, heuyaxx, yirkbjn, fqhag, ovqhdvy, zzxlo
wwcih (1585) -> dyveac, pejho, cyfuwdb, tojnst
alqog (157) -> dyvooj, wvkaie
qecgvu (19)
jexreg (209) -> bonnse, phgkg
vbisx (49)
bcukkvc (72)
trcbs (90)
xjxjaq (211) -> kfhwxyy, vnmxsi
uptgby (16) -> eocoy, lqjznss, petluuh
rjnht (63)
urhwog (146) -> mxscf, fwqru
caihc (158) -> kzjkjz, rjijdre
mwjtydb (15)
eqahcc (73)
rntjx (72)
ripmztc (96)
cksyln (93)
ktfeae (20) -> asoirn, jbxnffu, feonsg
bdukt (71)
jtxbfm (55)
ebwtpod (66)
fjerhwe (50)
xxshup (66)
jdyspx (97)
nyxiai (73) -> pjmci, ejvaoj, fbiqxqk
dxznun (49)
umwial (183)
mnsqjxv (50)
wtoive (80) -> nfcru, goicjt
zkzefwh (22)
oszyw (78)
ekxdjlp (60)
tymor (6)
jbydxyp (66)
dzlqgrt (43)
grsdifs (31)
pdepl (238) -> ulezwmd, fhlul
mbunh (8)
iwajy (70)
lknchr (68) -> nercz, skmvkj
klpctiz (75)
lazlx (8)
fbuhz (159) -> aarioi, fbrvfk
kvifa (69) -> fquywyi, ndmcgpn, vczcept, rjhfcl, jatvkwy, fodud, avaoo
ilydn (74)
nerlvh (85)
qqduoo (735) -> wgglzpb, tcrkcu, boete
gfxnuuk (34)
amwtic (72)
ltpban (87)
klyso (67) -> qenjyl, egabi, hmdwqdq
jotxc (57)
cqyluwl (9)
siyuvy (52)
bbsomm (61) -> izonhi, jjseenh
pzjsf (49) -> etnuzv, hrrampl
vshekb (34)
zvjrwke (27)
xekggcw (89) -> tvwosmc, dpfov, anvvug, fneqe
hsulvq (78)
idivffq (292)
bapvub (821) -> acnvtg, lvkpx, zeopgv, dcpnyer
ziwkz (331) -> eqzuic, qrtwjv
bvock (81)
vsyuckp (54)
bsoef (40)
ncjhpa (247)
axtzeb (13)
yotlucw (134) -> jbydxyp, ebwtpod
ceqfbbl (33)
qhbotj (62)
hrmpq (90)
pgznzly (13)
vgndgst (72)
auvla (65)
ylnvdoq (350)
fgxst (8)
pptocz (287) -> werriw, hglhjt
lqbtnb (35)
xvuri (293)
dbeskg (9)
crkapwa (87) -> ogpka, npdwg
bilzbf (803) -> brkux, qcoyrha, cplvif
byrvfhp (80) -> gqgewi, csear, vyadxnv, rqnsxm, cgjula, luuxtc, jzmqzl
cqiipxn (84)
oryrq (103) -> cabsaub, zfthi, palqky
gkzeqaw (38) -> iyflfx, hntdp
xqnrp (33)
zcomcn (70)
tjcpka (87)
nfcru (41)
vfpdqlb (43)
msdff (82)
tddik (43) -> vlthh, btbses
qlmojkv (264) -> tymor, xkfuzi, ligpl
sodrm (37)
mvvgro (84)
cbvjwlo (270) -> nsqzndf, synjm
kowco (46) -> gqrgh, nhxmab
xrapmvb (150)
iifltp (95) -> fowpeur, vjroix
tinbqcj (72)
lbjuqcd (19)
hlhomy (30) -> oylgfzb, ahayh, razvskj, hvtvcpz, teyrfjn, lqirhg, dxxty
veutu (53)
tfuxhhz (82)
oenrkia (44)
oipjwtz (40) -> tgqpp, mjbjv
ndcjr (75)
oermd (94)
xsmgj (99)
cfmhi (107) -> obrwb, hoelsa
nwyftp (72)
nmdhmy (39)
qslgo (92)
mjbjv (89)
hhvqa (41)
erysec (59)
xdnuvji (20)
bfxezgb (8)
njmrq (192) -> uufrda, pdmkag
gutukz (70)
acjtwvt (98)
kddchk (71)
apzjw (149) -> jetfvjc, peomyg
xzhvvy (431) -> ehxkgh, alcpfsx, kvjqli, tjdap
sowzlz (19)
ucvgxii (85)
uzprmq (83) -> ygteuy, exhxs, pfzqe
bvaor (35)
gekcx (78)
cxlip (44)
psnkhtd (157)
yimottm (2101) -> fsmzljm, uptgby, tvhfxfo, ickxyrm, nxqqsza
ocbxx (66)
acnvtg (277) -> wbbfe, nchjk
vangx (51) -> xobyzo, jdhiflw
sfoivjz (17)
lunbob (66)
ecabcm (190) -> vlwjehz, advlxrg
qarjx (7)
gyktq (98)
imfog (52)
zsdvfrk (1190) -> vxqcf, fvivhx, oxyxy
zssgj (44)
efbffd (20)
etdofb (62)
juakl (67)
iltti (60)
ffgoyk (74) -> jgdumgz, ltpban
lamtp (89)
loggp (75)
pejho (106) -> mqaajk, tnobvt, gxhia
enekg (55)
cplvif (95) -> xfanpad, uhepxt, lebqr, hqipq
dgsse (88) -> nwztmzp, akrgdse
rwjzc (107) -> qrfhxne, lcufpmj, paqlttl
drszzbe (132) -> ucjew, unfgdb, tokvgmd
vtnpx (79)
rrkhcl (26) -> seazs, koemv, qnxnatu
ekfpabq (37)
pwvmmda (278) -> rntylx, hrkswsk, zssgj
vqekr (85)
luccp (175) -> ebrgtq, rvuktmb, pslyfi
xkfuzi (6)
obaorae (45)
dpfov (96) -> roqnodm, adasbyp, uorpbn, zyonam, zjcdwr
lzowumq (41) -> sjthmr, mtboq, aeapmwq
pynxen (152) -> omzpkv, rwuxn, dpija, xgogpx
itxtmhb (72)
hanbscg (21) -> npsza, jdjaem, lvuzab, fffxc
teyrfjn (62414) -> ilfgats, qlgkqk, vyvcb, rnsxz
pocxfrt (39)
mqecf (76)
cpacyeu (67)
gycde (88)
tlhgrte (2388) -> xijwk, mmlra, ejtoqaj
jumdfk (64)
swsffrv (13)
fujvp (155) -> gwxkdy, hsftfol
dyxcd (87)
ljvpv (452) -> huutnfp, hoauxku, euvkg
xydxl (88)
ibdiplp (20)
xvwqzt (70) -> ppdsem, pyhqixj, rjnht
djmoed (90)
raioiq (134) -> ipdbccy, inspqeu
bwywt (67)
jfvquxv (70)
mtxzcd (282) -> ucvgxii, ngemsu
lfgmv (87)
lcufpmj (65)
pvwdkm (50)
dbnstqf (56)
jwgjnuu (33)
ndmcgpn (256) -> zvsnz, bpygf
rktkzfw (35)
zxeopkg (218) -> yjyipdp, drnyyes
nutlr (116) -> ybuhf, fjerhwe, xmrcq
cdkcn (39) -> dzlqgrt, vfpdqlb
jfrooen (95)
xmrcq (50)
qpuyqq (83)
hiqhe (361)
xuxlspe (44)
apvfi (59)
wahwi (303) -> lnnii, boxvu
affxphr (22)
lhtzrh (213)
yeewxiw (50)
zyxjqs (65)
kqgqdyg (69) -> yqctq, tcihaf
sqnfwo (67)
mbqkm (12)
mqaajk (18)
nxhetg (60)
hrxfpx (65)
wjfsiec (19) -> znpqzc, xvuri, vsxzpf, doazn, tjbyhjw, czxbmp, vqqrb
hsfxq (99) -> jtxbfm, lzhdsyq
lbiigt (26)
bwgkn (1005) -> uzily, urxxlfo, yqnbqgc, cgnibii
hpjgrb (73)
ajpcyv (42)
pirivl (144) -> bmovg, yexyj
szuiho (73)
lnhiiq (64)
yacaqwf (82)
nqcadtp (310) -> kzvwk, akatbi, gncvcwi
bvgfpab (15)
cxndroi (77)
efwhif (6)
njkxyjn (12)
kvpju (39)
gyyqk (5845) -> jeshqdv, xzhvvy, ynwpoz, jtlhia, gzykr, coyroy, tqjpfzx
jwpqgy (168) -> jxanwhq, fsixon, lnsyuz
jwxff (95) -> ihtomiz, xeprhhl
yycux (15)
fmhjs (79)
wvieaw (67)
iancjuu (39)
vczcept (112) -> muavtro, ipeig
mwtusu (81)
moewgvz (89)
gmfktbe (31)
dcpnyer (67) -> fmjyudw, wuhyc, icccxzg, nufpcxh
hnfeims (47)
rouiui (30) -> tqlentr, zdkil, veqahi, txnzg, euiig, qlmojkv
bppos (37)
hoauxku (219)
ficmghd (56)
lxpshey (95)
hglhjt (13)
oqbet (58)
bsmxm (88) -> trcbs, ewsrnsd, qzsowpu
dxerl (79) -> kdujkg, njkxyjn
gxhia (18)
eqifs (3869) -> aqjkcss, uiwgpi, cmeqx, jwlaj
hqipq (60)
upbmqk (18)
culvtcm (97)
cgdbu (90)
tnrpi (241) -> zjtid, xybcccw
hlullj (39)
ihcbt (44)
wfjgqqm (55)
dmzwm (86)
hvtvcpz (81171) -> dxcpj, eqifs, mdfbhs
uufrda (39)
lsfdgam (77)
huutnfp (57) -> blrzef, ihllda
vnmxsi (17)
tjbyhjw (161) -> ihcbt, tlxbtng, cxlip
fshvy (84) -> indgw, gynwftf
agsjzih (10)
ppdsem (63)
skmvkj (33)
oxyxy (205) -> aawxzzs, tdnzc
ywavdk (67)
pkxhxdz (70) -> gklur, vqekr, fnvgp
xsufhnb (66)
ouhfxyf (97)
dukqd (50) -> opyzwha, sfxsn, ndcjr, uystf
zybvpry (20)
wwobe (34)
bolxwme (74) -> jfvquxv, rsqexkv
adhilml (299) -> cqfri, mhassfj
icrnru (160) -> gutukz, fuega
oagluxi (40)
ligpl (6)
fttsg (255) -> gmfktbe, ebtbnei
ihtomiz (99)
gblxcsj (251) -> kuaeh, pmfpitp
lrvxyg (91) -> lfgmv, ohtzuf
wuhyc (71)
qjuud (160) -> ckexdc, oencfz
jbfzjha (305) -> vbmhjxo, txvuv, mkyqul, zehnmg
xjosf (89) -> dfdgoj, xagwh, xkpulvc, tnrpi
zkcwgx (22)
ilbopwx (87)
akatbi (222) -> qjazr, pizkx
uxuscb (249) -> jpeprwv, mdrir
hbgyu (19007) -> nqcadtp, tkeoe, jvpecm
kjzsi (56)
cduzde (13)
edoftkj (84)
lxisjl (86) -> euqvd, hugfkt
owxuzp (26)
nalhhj (4471) -> dkfepj, wjfsiec, egrga, dkxsqjt
vcaekf (67)
evwne (21) -> czztmlk, fmqon, fzzcxvm, rmdqvgh
crojfnw (171)
upiow (82) -> hukskkk, ilbopwx
srgua (120) -> koyke, hvefi
rcywun (81) -> moewgvz, fchlc
qlkqplv (138) -> hsulvq, ghuoa, ozwaa
czxbmp (197) -> ieeqmzl, yzivqv, arbebt
jjmyu (80)
cyfuwdb (40) -> mywmo, nppdvs, fwafvkf
hmdwqdq (79)
oencfz (10)
pjkjcy (20)
sxxhmpb (8)
uwpwbgy (213) -> gbiluq, xidye
mywmo (40)
rbmmiy (833) -> rwbhl, vtono, shkfk, umwial
dmvajb (50)
smuybnw (89) -> uktqwa, vdistyb
uagezb (984) -> hdvfyp, kwtukd, ikbkb
nrlvovz (840) -> qoipc, oznhe, uvhmzj, kebff
vbmhjxo (5)
ckafg (86)
ovqhdvy (2715) -> psnkhtd, zxqix, trnjhsl
uktqwa (90)
lzhdsyq (55)
kofvzz (66)
mcduq (60)
qnsnc (62)
kwtukd (232) -> nhzmidl, bfrbwb
zzavd (13)
fmjyudw (71)
vcnph (161) -> wqgpm, nnvpkf
lgamzp (64)
ukqcayx (92)
diduy (116) -> xwphya, msdff
izonhi (99)
jetfvjc (16)
rjhfcl (308)
vqqrb (179) -> jfaoy, jhgxtg
tulxdf (308) -> bcukkvc, zgydn
rxuqpgb (144) -> aqogxi, aicncxc
spyxh (32)
yqergs (100) -> kitsxb, woeoaa
bthswyg (34)
rfaxua (81) -> zugxr, dtyxosg
fcoxtp (42) -> aqqdnpb, nkgmg
jbxnffu (74)
bwthm (929) -> jwxff, ohiftl, aqtml
ionnnfx (97)
urigx (141) -> xsmgj, eyozeel
nsggol (249)
mgeseyn (267) -> hvacjk, pvgay
eqzuic (37)
pxdgkik (83)
zjqbfd (188) -> viklkmp, vfcbliu
wivwqm (74)
nowyhln (52)
sqsqge (219) -> amaeuv, paqvyfa
vynvu (87)
ovysqnt (86)
brfocu (230) -> zicvvl, zbhahq, agsjzih, ydhfmt
dgumiir (40) -> olzdhtj, inezd, kqrjpgl
vpjhl (27)
aqqdnpb (88)
qaszsa (94)
ajeisgv (95)
aoscme (73)
owlyge (65)
kdqslsn (73)
hukskkk (87)
vindf (73) -> szuiho, aoscme, fbdfh
kosxb (140) -> tcpujhx, itlsv
oeaqbvl (142) -> bsyiv, fiqzxhc
lyigbhi (105) -> pqmye, nzyiue
trnjhsl (73) -> iinql, yhzwdu, dtjzr
mkucbvs (138) -> ikxewmm, qhygx
fvplhrm (6)
qnvzqc (54)
jdbub (48)
opyzwha (75)
xeprhhl (99)
xounvb (101) -> mbqkm, zwpyj
aswpgvv (42)
razvskj (60626) -> dlzgufq, xwifd, nalhhj, lyhok
ygrbgm (172)
tcrkcu (329) -> ibdiplp, efbffd
mijxl (63)
ajfkd (9)
aaaak (6) -> mdopg, mzrafi
qgnah (42)
emppnct (78)
qysdgq (154) -> uutlw, klpctiz
hkewsbw (89)
lcfundi (52)
iccpjfn (92)
modzqb (30)
nsqzndf (51)
dpyuayl (18) -> wvieaw, cpacyeu, hwkwp
eocoy (67)
fbuklc (82) -> lcyuk, klzfl
ieeqmzl (32)
qcoyrha (255) -> kjqiop, oagluxi
lbfgh (123) -> obaorae, yktqkyl
payoa (194) -> khbvu, nrxoha
ywutc (71)
fodud (178) -> axmjgih, auvla
actggv (65)
jngcap (845) -> tydlqpq, ebdxuo, ktfeae
hcgbmwl (60)
lqirhg (70965) -> hbmxey, tlhgrte, xekggcw, lxffhxk, knhst
ifntl (26) -> emfbheo, heicvby, vcnph, qvgeei, gcylwr, uxuscb, ubrrbmk
uiasar (15)
sfkzoax (46)
bqtppn (236) -> xqnrp, fsguvid
peomyg (16)
sqincn (80)
zjtid (7)
cpvlq (72)
nwbmwa (17)
yjonn (185) -> rbhdx, cbnef, bvgfpab, czojwyg
jafdtcn (79)
uqofam (245) -> lxpshey, qwdppks
nkejtw (56)
tcihaf (28)
jwkgg (17)
hsftfol (46)
ehqavsc (22) -> aboilvw, diavsdh, nuybvi, ziyyvk, wyule, mtxzcd, tulxdf
dyveac (96) -> jdsdqzd, lhmjc
yfztc (74)
nuybvi (452)
ymfosm (38) -> hdkpuyx, ckafg, dmzwm
vrjea (1809) -> stcaf, hemnmbr, zuxvjpc
qteruty (8) -> mwtusu, pvpyhb
cpmcrx (13)
ouxjkf (18)
rvuktmb (147) -> yhlbg, cwgbjaq
blrzef (81)
guxwd (49)
yyyqzje (225) -> fnfiur, jfngjl
qbkipp (92)
wdlwryo (149) -> nxhetg, iltti
tjdap (240)
udxegjf (44) -> lzbbin, atfpsi, tuqzsn, ytnti, zdade, skotajh
aeliqqs (26)
shkfk (183)
adueu (372)
zbhahq (10)
jbtzoy (80)
pkcakwk (300)
hwkwp (67)
gatxz (45)
qizvid (38)
cbqebx (152) -> ornybn, zcfswa
ppmjzx (267) -> whlfwr, sfkzoax, csqyn
rwuxn (23)
pcdtne (6) -> fbuhz, alqog, hanbscg, fttsg, gblxcsj, cujhtj, adhilml
fvfitqc (39)
rgfur (104) -> aswpgvv, qgnah
jhgxtg (57)
pkotpki (86)
ujzjt (92)
zkikhk (16)
skotajh (328)
ycinfxk (1450) -> kosxb, cwvkon, nyxiai, bztor
gnffzh (234) -> tiiwbg, sfoivjz
juvwj (79)
ckcaugr (62) -> zebdkqz, xuxlspe
gjfkx (31)
blome (73) -> jjmyu, bljfcim
yqctq (28)
gpzaa (68) -> sqfopc, lxxfgli, yyyqzje, cjkoxak
qoipc (68) -> tjcpka, oydoajo
olhuxt (7)
zdade (166) -> oyfob, bvock
ihllda (81)
sbklnq (85)
yyblsz (54) -> nrmvc, dszjyr, bppos, tahstqe
qenjyl (79)
zukgdrx (79)
fszrgv (34)
ulezwmd (56)
xgogpx (23)
gwxkdy (46)
knhst (5583) -> ghjpcv, szvrql, ojtrl
mblvffb (79)
qowyx (56)
yablonq (18)
mwfryd (93) -> mldkiku, sveuu, kzjfme, kzwbhrg
xjafd (17)
njgzn (97)
jpeprwv (12)
lnnii (18)
tsetywu (22)
gdutjjl (73)
lnsyuz (27)
qyypm (417) -> uqofam, xtvyh, ajpujs
uutlw (75)
cbnef (15)
gikqie (90) -> qpwfl, pxhbe, yxcbn, lftlpr
nkuesm (60)
znpqzc (53) -> ekxdjlp, skvytv, nkuesm, ajtkddh
mszwp (53) -> qaszsa, tupro, otljqmh
stcaf (54) -> cufaveh, foblbqu
nmlykny (112) -> uitef, lsfdgam
frlmoih (92)
hqvvrd (34) -> juvwj, ayafxml
unzzng (22)
xucelzn (49) -> jumdfk, ilzwrk
nyjmiyq (91)
zfjpii (181) -> btjxv, rfhjgxy, digfyo
vyvcb (4479) -> jsniger, rbmmiy, zvildgh, kvtvmi, ogiie
fwqru (62)
skvytv (60)
ujogppt (95)
mgzotal (125) -> frgot, sjcbxp
ytpiey (83)
bfqba (872) -> vopeoj, gfknji, iwdesog, qteruty, lxisjl
foblbqu (20)
bzlgar (37)
dszjyr (37)
nrpyfqd (39) -> nihmyu, acjtwvt
vgvvr (66)
hzsgvc (8)
lddiw (7)
ydhfmt (10)
uspvnv (94)
seazs (92)
zrydf (108) -> zzavd, ppbevc
pkglsge (93)
oamrbi (33)
bendlfs (92)
rkgxu (88)
fqhag (2673) -> vangx, crojfnw, njrzjdt
wesyh (26)
jbaazop (19)
tgvdjhh (72)
ebdxuo (242)
xthhlfy (61) -> jafdtcn, kbout
vlthh (88)
sqfrw (830) -> ppmjzx, vixlf, ryskzh, ynkkomw
kzjfme (55)
heicvby (145) -> akrsjfc, lnhiiq
cuaect (114) -> ftdkas, jwgjnuu
oyjtku (93)
eyozeel (99)
rfhjgxy (227)
eoasnfq (94) -> idszh, vshekb
phgkg (30)
dxgnqsj (34)
egrga (1130) -> nrpyfqd, cfmhi, uwpwbgy, zqtok
sljgt (1013) -> iifltp, igfjvkm, rxefab
bszcup (56)
kkyfjh (83)
frvmu (143) -> xdnuvji, vwhynu
fsbojm (41)
mavbgo (91)
digfyo (188) -> tkejpfe, ynirne, swsffrv
xoyjtol (59)
qvbuj (1045) -> dgumiir, ofnmnyy, mkucbvs
dzetsz (1418) -> nsbli, ulxsa, krdlzf
zguqo (92) -> ripgc, oenrkia
klgsk (6)
yktqkyl (45)
jhcurc (50)
teuzi (57)
gfknji (26) -> nwyftp, vgndgst
gcylwr (221) -> wesyh, lsycscb
hxaza (7)
asoirn (74)
ofnmnyy (36) -> sziwpzi, zyxjqs
xobyzo (60)
azdklp (43)
mcfst (47)
vwqog (43)
tupro (94)
lytukj (25)
roqnodm (92) -> qbbmsf, oxewutr, pdcaqbr
axmjgih (65)
ezztp (87)
luuxtc (2600) -> qfkka, dxznun
pvzyops (94) -> oiyxr, ffrilz, upiow
adasbyp (237) -> kdqslsn, xantdh
iaiywwa (1850) -> nhxfu, boiic, kqgqdyg
zdkil (214) -> cemygp, bgctgn
pslyfi (7) -> ilydn, birahww, yfztc
wbllfh (43) -> xwmnaj, gprznw
drnyyes (66)
coyroy (175) -> oevvote, zzwtuu, klyso, pirivl
ddkgzi (19)
btbses (88)
mhassfj (9)
rbhdx (15)
kfhwxyy (17)
ozwaa (78)
lhmjc (32)
lftlpr (11)
ncaoc (58)
zacywmu (12)
vixlf (45) -> cgdbu, djmoed, npfkpts, eisrj
vwtmps (142) -> jljnags, qizvid
fsguvid (33)
gxdtiob (203) -> vbisx, gzter, bzkwsro
xwphya (82)
jtujnwo (37)
wyule (401) -> nwbmwa, pvpqoq, jwkgg
wpgyc (96)
jbvugg (224) -> dxgnqsj, fsfuluo
tojnst (160)
jeshqdv (1303) -> affxphr, lyhxuh, zkcwgx, cqdtav
icncbl (48)
kqiraxg (54)
aicncxc (29)
zbedu (209)
pdmsm (57)
kictlpo (37)
brkux (335)
zrbkrdx (41)
otljqmh (94)
kcreb (48) -> ihuzl, bvaor, popymuq
muavtro (98)
ayypg (56)
vdistyb (90)
euvkg (203) -> mgwauar, lazlx
ayafxml (79)
bnvjmae (7)
ogpka (80)
gnrqrsj (2189) -> ortcrq, upbmqk
rxefab (131) -> vcaekf, sqnfwo
pgpnvo (931) -> eahos, kcreb, lwefm, bbdimns
bphrvm (64)
doazn (211) -> siswh, hhvqa
sawqp (32)
mwdvbr (68)
mtboq (76)
dxcpj (93) -> afcgdxg, kzwgln, wkydaz, spkeqv, udxegjf
lyhxuh (22)
iuovz (88)
csear (1969) -> fnijmph, mgzotal, evmblgk
rojhup (7)
ebtbnei (31)
lhnevgo (269)
zibbm (85)
nrmvc (37)
txxpej (280) -> actggv, krqxe
lhvtmoo (130) -> icncbl, zbtck
wgwkss (80)
aawxzzs (22)
aarioi (79)
cabsaub (60)
otymybu (223) -> ddkgzi, viafs
cbgfg (58)
wcinck (20) -> ziwkz, wfeupmd, drszzbe, mgeseyn, xasioks, xtjrkv
orkcq (65) -> iujqo, ehdax
okfcek (97)
ybbrr (247)
iatmtm (55) -> lwxts, mqecf, tuhxr
yyxmp (80)
ysvjxvz (78)
birahww (74)
mxxfu (57) -> qdovgra, ywlrls, wahwi, mzjwcds, axrojbs, urigx
xbqpjo (98)
kqmhotc (94) -> rkuyxrc, wfjgqqm, xdylc
qwtodu (71)
qdxteam (61) -> ybbrr, frrvvai, ncjhpa, onuxzz, jvepbal, qznpwb
fbiqxqk (59)
rokie (9708) -> vmgqltz, qdxteam, srvwd, qvbuj, pgpnvo, hxjhcuc
ovmvvkl (24) -> tvhgbau, exgsmmj, uwvbon
qnxnatu (92)
hrkswsk (44)
ndodv (296)
koemv (92)
hfqjj (37)
yexyj (80)
fhlul (56)
dzzbvkv (64)
gmhxee (74)
jbgqlat (65)
qclpa (84)
indgw (91)
krqxe (65)
lmmeg (26) -> ummcw, zqhdiwz
bgmwpam (68)
wpfbdof (151) -> sbutyr, klgsk
qznpwb (153) -> vfmwzb, haicg
hdpemqh (168) -> txxpej, pwvmmda, gadyi, mvhqou
gpfaupm (13)
iqfmvz (67)
pdcaqbr (97)
qfkow (64)
exhxs (89)
zebdkqz (44)
rrtqyew (191) -> zbxakfn, ajfkd
ukrki (39)
hvacjk (69)
udfuty (32)
mrgccl (85)
uzily (82) -> swscfel, apzabs
lxffhxk (1245) -> bfqba, cpxgct, rouiui, qyypm
jfngjl (86)
ceevpgx (47)
sziwpzi (65)
pqmye (57)
phkvcix (90) -> nubay, jaamgi
gxcnp (27)
wmwzhjg (73)
miuvc (283)
nvtbk (1775) -> srgua, ckcaugr, xrapmvb
zfthi (60)
inezd (42)
irzuowk (90) -> ayqgp, zruqij, oqbet, fdckzry
zuxvjpc (62) -> mbunh, mgvoh, bfxezgb, sxxhmpb
wmyvz (59)
tqjpfzx (47) -> gjupqe, lwhev, bxhjjd, fmquyhw
xhwfcu (75)
tnltvzk (90) -> cevkjvr, hrmpq
uhepxt (60)
sjixg (25)
kuaeh (33)
uwvbon (79)
jzoue (94)
hdspavt (60)
kosgqpu (50)
mznkfco (79)
xfanpad (60)
zcpyr (81)
gutifk (228)
scipnb (53)
ejvaoj (59)
ybuhf (50)
bpmkexj (166) -> mbokr, ytbtswy
ogafygg (39)
fooowuf (42)
yiwdaj (86) -> iwajy, aftsom
hoelsa (64)
cjvdngb (91) -> qedkzuz, vtamjj
rsqexkv (70)
ftqtzxk (43)
azgjimy (92)
bochc (39)
qfsue (35)
objqgkm (146) -> tsiuz, glguoq
tatjry (47)
tcpujhx (55)
nnvpkf (56)
gatdr (89)
jcmviuv (37)
pzhyoh (3960) -> bkset, bfwbkxq, zsdvfrk, wrobpcw, ffxnegs, ifntl
svyojyu (60) -> qslgo, ukqcayx
sxbusu (73)
jtikaai (194) -> yukoxaw, qftqq
nkgmg (88)
zolmsue (66)
ziyyvk (60) -> yuypmb, ctoxz, dcwpsvy, mxrfq
bgcjrf (80)
qlqqlq (350)
npsza (74)
eahos (19) -> ywavdk, iqfmvz
cpxgct (14) -> tabzzo, svyojyu, pynxen, idooz, nzorg, zudqkt, fsvkj
nxrkz (1541) -> gutifk, avqjqdf, mgyfdm
twzgms (43)
uwizfa (88)
tiush (60)
cqpns (123) -> tfnem, kqguihx
necmih (10) -> dppzdx, zvelptp, tpsgt
ehxkgh (172) -> bthswyg, lbojqfo
yxoqwg (80)
emfbheo (85) -> uspvnv, oermd
siisskc (13)
icccxzg (71)
pjvpqmg (64)
dxxty (64884) -> ljugvh, gyyqk, pzhyoh
neladb (11)
polrzc (59)
snvqyqb (66)
lebqr (60)
shfjyzk (68)
acdkw (1907) -> apzjw, ialtabg, cjvdngb
xdylc (55)
hknzmvs (93)
obrwb (64)
werriw (13)
jjjfkf (19)
zqckoxe (118) -> vynvu, zgnwz
mgvoh (8)
oxewutr (97)
qqydcts (62)
pjkwlmk (56) -> etdofb, qqydcts
kzwbhrg (55)
cgzyc (669) -> bqtppn, rwjzc, bwylliz, rrkhcl
sltrdk (88) -> qwtodu, rpkpa, kddchk, xirqz
aqjkcss (77) -> rfaxua, nsggol, uxlcvt, jwpqgy, tjobe, ovrkpd
xagwh (99) -> sdigtox, pocxfrt, iancjuu, iefyz
apjxafk (1513) -> rznyr, oamrbi
uturjs (85)
qwxrsa (261)
cgjula (2020) -> lhvtmoo, yiwdaj, biwdu
yakzm (16)
ejtoqaj (1426) -> whggku, ktehtif, wpfbdof
eoaprcr (93)
otaty (141) -> ydpihb, ouabc
rjijdre (17)
atfpsi (196) -> qoqydb, vgvvr
qjazr (21)
petluuh (67)
xdupyte (19)
rpkpa (71)
aytjryx (25)
pfmor (80)
rfbdpc (66) -> payoa, ymfosm, ndodv, thutxib, objqgkm, gjjfju
kkciirc (71)
hfnijbd (234) -> qarjx, olhuxt
mrvdvga (54)
vwhynu (20)
nnsyc (59)
rlwvuj (280)
vtono (37) -> gdutjjl, eqahcc
jdjaem (74)
hgcxyx (13)
mkjvhl (282) -> neladb, tsrrzuc
cmeqx (521) -> uzprmq, xjmrcc, qlqqlq
fffxc (74)
sbutyr (6)
jikzxd (50)
zvildgh (1079) -> wtoive, rbucosf, eoasnfq
unfgdb (91)
npdwg (80)
ftdkas (33)
ewdpntl (66)
akrgdse (63)
vczudlu (17)
ablvgzq (58)
kbout (79)
aqogxi (29)
igfjvkm (265)
rkbtnzd (40)
jatvkwy (92) -> kqiraxg, vsyuckp, zwjds, mrvdvga
mjuwde (888) -> cbqebx, kihxgg, zjqbfd
ytbtswy (57)
rugzyaj (16029) -> apjxafk, jngcap, wrtyhxg, hblcbb
fuega (70)
lejoaru (64)
zvelptp (28)
mdfbhs (5185) -> miymiit, jjgem, gpzaa
xwifd (7225) -> rfbdpc, qqduoo, uagezb
bxhjjd (172) -> yacaqwf, ngksxux
xduga (88)
rwbhl (183)
cpazla (101) -> ayypg, kjzsi
ttmei (19)
hblcbb (5) -> qwxrsa, ovmvvkl, orkcq, otymybu, sjxbk, frqtkkr
lzbbin (250) -> ujzofuy, urwgjd
bgctgn (34)
uaqik (15)
kvpztt (93)
zeopgv (312) -> pgznzly, ixwyi, tefcd
oyfob (81)
yhzwdu (28)
xwmnaj (41)
ngksxux (82)
brmtxo (300)
kdujkg (12)
cjlxgf (165) -> bsoef, rkbtnzd
tefcd (13)
jsniger (680) -> lycpdcu, iihzs, aubhuwo, xucelzn, qykoae
thutxib (138) -> mblvffb, zukgdrx
npfkpts (90)
yqbkjg (51)
tsiuz (75)
otvvje (43)
boxvu (18)
etnuzv (27)
fkmccg (32)
zzxlo (2220) -> zhiai, oqhwa, irzuowk
haicg (47)
veqahi (50) -> yugjkuz, ncaoc, hfjhadi, cmzoogc
uystf (75)
wqxcn (292) -> ddrrgp, sxvlfn, ipmbqts
jlbhafs (27)
lvuzab (74)
hrfyodg (84)
apctfnv (246) -> baygmx, zacywmu
wafjawl (56)
dlsss (88) -> mijxl, voonmio
nlrobhq (87)
jzdmjdf (1849) -> aaaak, necmih, fmifd, kowco
yzivqv (32)
cufudi (97)
zwjds (54)
pizkx (21)
fbdfh (73)
cwvkon (193) -> cepqh, jjjfkf, xdupyte
wqgpm (56)
vopeoj (14) -> sgqaiyz, ysvjxvz
zqtok (151) -> fhgnht, fooowuf
fugeht (89)
mgyfdm (60) -> mvvgro, hrfyodg
wqdvql (39)
ogiie (573) -> hfnijbd, cxokosi, jtikaai, ffgoyk
tgqpp (89)
fdaddso (15)
cmzoogc (58)
gjjfju (270) -> kndcyxb, cpmcrx
wowkfnh (64)
lwefm (115) -> ageyuq, jbaazop
qykoae (61) -> cbgfg, dyfhy
ipeig (98)
iyjcoy (63)
omzpkv (23)
kqguihx (48)
qrtwjv (37)
sgqaiyz (78)
gzdxgvj (64)
wfeupmd (65) -> pdjnnzd, mrgccl, uturjs, yfszfef
vmgqltz (841) -> ecabcm, vigvho, ppfyonm
txvuv (5)
zfcylzq (113) -> ocbxx, kofvzz
vigvho (76) -> vtnpx, hjdms
njrzjdt (171)
iyflfx (90)
spkeqv (1828) -> qbkipp, bendlfs
dqiyfw (21) -> mliwyi, kvpztt, oyjtku
nufpcxh (71)
ppbevc (13)
bljfcim (80)
hjdms (79)
mcfrv (19)
zruqij (58)
gmurq (89)
zyqqzou (78)
pyocxtt (27)
akrsjfc (64)
nzorg (102) -> bdukt, kkciirc
vobfi (734) -> lbfgh, wfbuzbg, kklix, hpsxqdm, lhtzrh, cpazla, skhmac
zugxr (84)
ldwhpl (324) -> takkbk, thneyz
kzwgln (1217) -> evwne, lrvxyg, hllzej
heuyaxx (2337) -> iatmtm, pabgfh, oryrq
kzjkjz (17)
ykmej (92)
sqfopc (33) -> mavbgo, uucyyr, nyjmiyq, tygst
qcpuch (270)
qcolnc (11) -> ewdpntl, zolmsue, lunbob
tfxyjz (87)
fiqzxhc (38)
hvhtokr (95)
ledgpb (132) -> kqltx, wivwqm
bonnse (30)
dcwpsvy (98)
xjmrcc (268) -> yucwtc, ilueo
bzkwsro (49)
zziyhz (18)
qoqydb (66)
ubrrbmk (87) -> pkglsge, gjorp
cgnibii (188) -> pqvid, uiasar
sxvlfn (23)
gqgewi (2538) -> ndxuv, egulpbe
qosqq (47)
jkczp (37)
pxhbe (11)
vpjmvzd (37)
rvjzxtg (86)
pfzqe (89)
uvhmzj (114) -> bphrvm, lgamzp
gklur (85)
wbbfe (37)
wkumzkr (1049) -> nxtyiha, modzqb
pyhqixj (63)
ohtzuf (87)
lsycscb (26)
bdsibf (87)
gzter (49)
ogelzdv (87)
fstzdn (97)
ebktv (146) -> gpfaupm, cduzde
iinql (28)
tdurwbh (58)
hnvybq (268)
sfxsn (75)
jgdumgz (87)
zqhdiwz (96)
rznyr (33)
ouqwmnj (265) -> jdbub, evqrr
tiuag (62) -> xhbjag, bmehz
fdckzry (58)
hdkpuyx (86)
hemnmbr (16) -> ukrki, mgsasl
rupdbwl (43)
bbdimns (57) -> upftju, iracqt
ipdbccy (34)
fbrvfk (79)
hueqfk (85)
bxrkfwo (67)
fwafvkf (40)
nsbli (47) -> hpanc, xjafd, uqjmbb, ycnih
ifhpy (79)
fneqe (1219) -> vmatvgx, bofjde, hhnpg
mliwyi (93)
utqxb (37)
fvivhx (75) -> nwlyt, dyxcd
whggku (97) -> vomrnc, ceqfbbl
kndcyxb (13)
ynwpoz (785) -> raioiq, yyblsz, rxuqpgb
hrrampl (27)
kkftjia (87)
rvxed (122) -> rktkzfw, qfsue
miauii (66) -> kpjxln, icrnru, dqiyfw, brmtxo, pkcakwk
bkset (857) -> brfocu, thvjlgo, urhwog, apctfnv
nhxfu (35) -> lwufmc, gatxz
skhmac (101) -> dbnstqf, wafjawl
bdwswow (65)
lgoak (70)
mdrob (51)
fsixon (27)
hcyohc (85)
kihxgg (44) -> awhwxdm, sbgtiqe
hdhvzi (1759) -> kzhpyr, apvfi
bwylliz (110) -> kwvybk, ftexc
xijwk (841) -> bsmxm, xrise, uzjoys
xkpulvc (93) -> fbvvrqt, zcpyr
xhbjag (76)
azrpi (92)
lxxfgli (49) -> nlrobhq, ogelzdv, tfxyjz, bdsibf
qedkzuz (45)
bmehz (76)
exgsmmj (79)
ijcxfx (136) -> jbgqlat, bdwswow
nsvrfae (71)
offas (58)
ipofw (15)
matcdld (35)
gjorp (93)
bofjde (152) -> jcuiffa, vvkbav
yxqesmi (172)
eisrj (90)
pjmci (59)
palqky (60)
aipmq (41)
ripgc (44)
ehdax (98)
jtlhia (749) -> tiuag, bdbxp, dlsss
uucyyr (91)
dtqbtvx (223) -> izyjved, etnkepp
yhlbg (41)
kwvybk (96)
fhgnht (42)
ummcw (96)
khkuxc (1254) -> qqhjlu, gekcx, vrajpg, emppnct
nwlyt (87)
txnzg (74) -> lcfundi, tifkr, imfog, imbpvgl
dkzitf (20)
bdbxp (80) -> fcvpdiz, bxrkfwo
degnsd (177) -> eetxll, jkczp, ghzqyv, kictlpo
zudqkt (142) -> fszrgv, wwobe, jbjkp
zjcdwr (249) -> bqcizg, saiyjff
sjthmr (76)
kryoh (144) -> jcmviuv, hfqjj
ghuoa (78)
uitef (77)
cjkoxak (340) -> sowzlz, ttmei, lajyaur
pczkz (88)
itlsv (55)
nwztmzp (63)
tsrrzuc (11)
rxrzt (65) -> krembdy, zrbkrdx, aipmq
frqtkkr (185) -> qecgvu, lbjuqcd, mcfrv, kwqcbe
mdrir (12)
vytdgko (97)
tkeoe (865) -> wzcgi, awsphe, ifhpy
orwbp (96) -> ecjujqu, iccpjfn
ckexdc (10)
popymuq (35)
euiig (166) -> ablvgzq, tdurwbh
ibjbozh (895) -> ijcxfx, nmlykny, fshvy, nutlr, yotlucw
idszh (34)
tfnem (48)
kqrjpgl (42)
ewsrnsd (90)
rnsxz (9718) -> pvzyops, zfjpii, luccp
avqjqdf (50) -> dilefzx, dulpw
euqvd (42)
dulpw (89)
nppdvs (40)
gncvcwi (104) -> pfmor, yyxmp
fmquyhw (188) -> hwqvzw, huspq
hpgktb (60) -> hcgbmwl, tiush
iyxkzat (49)
seyed (86)
zzwtuu (260) -> unzzng, ebsxx
nfvsrpa (876) -> kwwhb, blome, otaty, dtqbtvx
mnwhky (1339) -> hqccsb, ldflo, rgfur, rxrzt
kebff (242)
cogovv (74)
takkbk (57)
yyswun (98)
ecjrblb (68)
ycawl (224) -> vpjmvzd, bzlgar, jtujnwo
dppzdx (28)
alcpfsx (136) -> siyuvy, nowyhln
dfdgoj (153) -> aufym, pfxrf
jcuiffa (56)
yjyipdp (66)
ilueo (41)
iazte (201) -> tsetywu, zkzefwh
diavsdh (326) -> wladmn, zudqxa, ajpcyv
llofnny (66)
kitsxb (59)
kqltx (74)
klzfl (93)
tpdcb (84)
afcgdxg (1202) -> qcpuch, njmrq, tnltvzk
gnwjseo (600) -> pkxhxdz, jbfzjha, ixdcgsa, degnsd, fwtfkp
yqnbqgc (178) -> dkzitf, zybvpry
ialtabg (21) -> jbtzoy, sqincn
uorpbn (353) -> ygbyt, afjmzb
jdhiflw (60)
qpwfl (11)
xasioks (405)
lajyaur (19)
ajpujs (271) -> zxzkl, dkgsvl
ovrkpd (147) -> sdzoy, mdrob
sveuu (55)
jtvntr (83)
pvgay (69)
boiic (80) -> ipofw, ggjmhab, mwjtydb
sjcbxp (59)
uvzwdly (20)
sbgtiqe (91)
luzcpkn (43)
ndxuv (80)
tkejpfe (13)
ggjmhab (15)
szvrql (46) -> cnknlru, zrydf, cvvtz, uwiza, gikqie, lknchr
lvkpx (233) -> wmyvz, nnsyc
bhzbv (28) -> azgjimy, frlmoih, azrpi
cujhtj (193) -> qhbotj, qnsnc
vmatvgx (90) -> uaavvo, ezztp
pvpyhb (81)
mdpcfvu (176) -> gyktq, yyswun
aubhuwo (99) -> yyqleqa, nmdhmy
wgglzpb (191) -> gmurq, hkewsbw
amaeuv (58)
ijleirw (172) -> jikzxd, yeewxiw, jhcurc, kosgqpu
tvhfxfo (105) -> wnzdcc, bszcup
kzvwk (74) -> ujogppt, appkqpe
qgxcbt (68)
ipmbqts (23)
woeoaa (59)
yfszfef (85)
ickxyrm (87) -> hrxfpx, owlyge
mjlmuca (41)
iracqt (48)
dtyxosg (84)
vyaoad (83) -> tojpm, euaceg, zhffrzu
jemmk (47) -> mwdvbr, shfjyzk
viafs (19)
iefyz (39)
wkydaz (332) -> orwbp, xhhfsuw, ledgpb, rlwvuj, bpmkexj, diduy
zhiai (228) -> qosqq, ceevpgx
aydmhhv (87)
vtamjj (45)
egabi (79)
zgnwz (87)
kvtvmi (39) -> fpmwz, oeaqbvl, oipjwtz, usevgds, vwtmps, kryoh, gkzeqaw
sszzop (89)
uaavvo (87)
xtvyh (83) -> pczkz, xydxl, xduga, gycde
fpgciql (51)
ynkkomw (279) -> iyjcoy, ijiqjtf
yirkbjn (1872) -> wjjar, ldwhpl, kcimi
paqvyfa (58)
khbvu (51)
jvpgl (20)
sxslizl (86)
gbpcav (77)
kjqiop (40)
ulxsa (115)
nhzmidl (27)
nchjk (37)
yokqfgn (94)
qwdppks (95)
fnijmph (90) -> yqbkjg, ykvtr, fpgciql
xucdiz (6) -> kkyfjh, cxjyxl
ftexc (96)
krembdy (41)
gzykr (1135) -> lejoaru, qfkow, wowkfnh, pjvpqmg
srrxb (81)
ylwniqh (68)
usuujhq (46) -> pkotpki, seyed, jgkmy
ilfgats (6031) -> mxxfu, vrjea, mnwhky
urxxlfo (84) -> juakl, bwywt
fsfuluo (34)
staqwo (8)
ynirne (13)
zyonam (217) -> sofxmjx, ytpiey
ornybn (37)
jvepbal (79) -> cqiipxn, qclpa
goicjt (41)
bfpvsfz (39)
zbxakfn (9)
cqdtav (22)
cufaveh (20)
zxqix (157)
zudqxa (42)
fcvpdiz (67)
kzhpyr (59)
cuwqi (104) -> jotxc, teuzi
mdopg (44)
pyntdrr (320) -> lbiigt, aeliqqs
ouabc (46)
wnzdcc (56)
wvkaie (80)
axrojbs (239) -> aytjryx, xbpqmua, sjixg, lytukj
lcyuk (93)
tdnzc (22)
wrobpcw (1196) -> fujvp, gfuxooq, crkapwa
hyfswg (1414) -> rcywun, kqmhotc, xvwqzt, bbsomm
yugjkuz (58)
tokvgmd (91)
yyqleqa (39)
pmfpitp (33)
nhxmab (24)
hwqvzw (74)
hntdp (90)
nercz (33)
kvjqli (72) -> tpdcb, edoftkj
zdrfiw (80)
viklkmp (19)
evmblgk (183) -> yycux, buifcn, uaqik, fdaddso
wzcgi (55) -> hzsgvc, staqwo, fgxst
baygmx (12)
mxscf (62)
oqhwa (186) -> gcbvf, bgmwpam
sflwom (253) -> uvzwdly, pjkjcy, rcongvf
ajrcal (83)
yqyyoj (33) -> lftlc, npcyutn
tpsgt (28)
ebsxx (22)
aceiy (13)
jwlaj (1031) -> qjuud, tdtznh, cuaect
hvefi (15)
nxtyiha (30)
mzjwcds (229) -> icqsww, pitdti
ndxim (6)
vomrnc (33)
vfmwzb (47)
jidxg (64)
aqtml (293)
cevkjvr (90)
lycpdcu (5) -> rvjzxtg, ovysqnt
thmlk (34)
iujqo (98)
synjm (51)
paqlttl (65)
kklix (25) -> jzoue, yokqfgn
usevgds (44) -> aydmhhv, kkftjia
tqlentr (214) -> gfxnuuk, thmlk
"""

let testinput = """
pbga (66)
xhth (57)
ebii (61)
havc (66)
ktlj (57)
fwft (72) -> ktlj, cntj, xhth
qoyq (66)
padx (45) -> pbga, havc, qoyq
tknk (41) -> ugml, padx, fwft
jptl (61)
ugml (68) -> gyxo, ebii, jptl
gyxo (61)
cntj (57)
"""

class Node: CustomStringConvertible, Hashable {
	var name: String
	var value: Int
	var weight: Int = 0
	var parent: String?
	var children = [Node]()
	var sublist: [String]
	
	init(name: String, value: Int, sublist: [String]) {
		self.name = name
		self.value = value
		self.sublist = sublist
	}
	
	var description: String {
		return "'\(name)': (\(value)) weight: \(weight) -> \(children.map{$0.name})"
	}
	
	var hashValue: Int {
		return weight.hashValue
	}
	
	static func == (lhs: Node, rhs: Node) -> Bool {
		return lhs.weight == rhs.weight
	}
}

func parseLine(_ input: String) -> Node	 {
	var input = input
	var sublist = input.split(separator: ">")
	var subNames = [String]()
	if sublist.count == 2 {
		input = String(sublist[0])
		subNames = sublist[1].split(separator: ",").map ({ $0.trimmingCharacters(in: .whitespaces )})
	}
	let name = String(input.prefix(while: {String($0) != " "}))
	input = String(input.dropFirst(name.count + 2)) // open (
	let value = (String(input.prefix(while: {String($0) != ")"})) as NSString).integerValue
	return Node(name: name, value: value, sublist: subNames)
}

func generateGraph(_ input: String) -> Node {
	// Generate nodes and sublists
	let lines = input.split(separator: "\n")
	var nodes = [Node]()
	for line in lines {
		let node = parseLine(String(line))
		nodes.append(node)
	}
	
	// dictionary of nodes, with names as the key
	var nodeDict: [String: Node] = Dictionary.init(uniqueKeysWithValues: nodes.map{ ($0.name, $0) })
	
	// assign parents to nodes
	let nodeDictKeys = nodeDict.keys
	for key in nodeDictKeys {
		let node = nodeDict[key]!
		for subname in node.sublist {
			let subnode = nodeDict[subname]!
			subnode.parent = node.name
			nodeDict[subnode.name] = subnode
			
			node.children.append(subnode)
			nodeDict[node.name] = node
		}	
	}
	let root = nodeDict.filter { $0.value.parent == nil }
	return root.values.first!
}
var root = generateGraph(input)
print("Part 1: \(root.name)")

// Recursively calculate weights
func calcWeights(_ node: Node) -> Int {
	guard node.children.isEmpty == false else {
		return node.value
	}
	node.weight += node.value + node.children.map({ calcWeights($0) }).reduce(0, +)
	return node.weight
}
_ = calcWeights(root)

func findUnbalancedNodeValue(_ node: Node) -> Int {
	
	guard node.children.isEmpty == false else { return 0 }
	
	// need to compare weights, but want value for final calc (only for the odd one out).
	// cheat by making Node hashable on weight (since we only care about the odd one out).	
	var countedDict = [Node: Int]()
	for child in node.children {
		countedDict[child, default: 0] += 1
	}
	
	// is this level unbalanced?
	if countedDict.keys.count > 1 {
		let correctValue = countedDict.first(where: { key, value in value > 1})!.key.weight
		let oddOneOut = countedDict.first(where: { key, value in value == 1 })!.key.weight
		let unbalanced = countedDict.first(where: { key, value in value == 1})!.key
		let delta = abs(oddOneOut - correctValue)
		
		// go deeper.
		let childNodesUnbalanced = node.children.map { findUnbalancedNodeValue($0) }.filter { $0 != 0}.count > 0
		if childNodesUnbalanced {
			for child in node.children {
				return findUnbalancedNodeValue(child)
			}
		} else {
			return unbalanced.value - delta
		}
	}
	return 0
}
print("Part 2: \(findUnbalancedNodeValue(root))")



