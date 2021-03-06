<TeXmacs|1.0.7.4>

<style|letter>

<\body>
  <surround|||<doc-data|<doc-title|CS157 Homework
  5>|<doc-author-data|<author-name|chaoqian and silao_xu>|<\author-address>
    \;
  </author-address>>|<doc-date|<date|>>>>

  <section|Problem 1>

  Bilbo has a long journey ahead of him and wants to stay in comfortable
  hotels along his route each night, but can only walk 20 miles in a day.
  Fortunately, he has a guidebook charting the locations of all the hotels
  along his route. (Bilbo already knows which route he is taking; he only has
  to choose where along his route to stay each night.)

  <\enumerate-numeric>
    <item>(8 points) Find a greedy algorithm for Bilbo to compute how to
    finish his journey in the least number of days. Points on this problem
    will only be given for the proof that your algorithm is optimal; more
    points will be given for simpler and clearer proofs.

    <\itemize-dot>
      <item><with|font-shape|italic|<strong|Greedy Algorithm>>

      Let start point be <with|mode|math|s> and the destination be
      <with|mode|math|T>. The <with|font-shape|italic|Get-Next> routine and
      the following algorithm will find return the minimum days spent on the
      journey.

      <\code>
        <with|font-base-size|9|<\verbatim>
          01 def <with|font-shape|italic|Find-Way>(s):\ 

          02 \ \ \ \ n = <with|font-shape|italic|Get-Next>(s)\ 

          03 \ \ \ \ if n = T then do:

          04 \ \ \ \ \ \ \ \ return 0\ 

          05 \ \ \ \ else:

          06 \ \ \ \ \ \ \ \ return 1 + <with|font-shape|italic|Find-Way>(n)\ 

          07 end\ 

          08\ 

          09 def <with|font-shape|italic|Get-Next>(s):\ 

          10 \ \ \ \ n = s.nextHotel\ 

          11 \ \ \ \ while n.distFromStart - s.distFromStart
          <math|\<leqslant\>> 20 do:\ 

          12 \ \ \ \ \ \ \ \ s = n

          13 \ \ \ \ \ \ \ \ n = s.nextHotel\ 

          14 \ \ \ \ end\ 

          15 \ \ \ \ return n

          16 end
        </verbatim>>
      </code>

      <item><strong|<with|font-shape|italic|Correctness>>

      <\itemize-minus>
        <item><strong|Claim>. Our algorithm terminates.

        <with|font-shape|italic|Proof>: The <with|font-shape|italic|Find-Way>
        would recurse on the next route point (the hotel along the route he
        will live in at night). Since the destination of the route is finite,
        therefore line 3 would become true at some point, so our algorithm
        can terminate.

        <item><strong|Claim>. <with|font-shape|italic|Find-Way> satisfies the
        feasibility that Bilbo walks at most 20 miles every day in the trip.

        <with|font-shape|italic|Proof>: Based on the assumption that the
        distance between every consecutive pair of hotels would not exceed 20
        miles, in <with|font-shape|italic|Get-Next> line 10, the first next
        hotel we look at would not 20 miles further than <with|mode|math|s>.
        Also, in <with|font-shape|italic|Get-Next> line 11 we limit that the
        furthest hotel from <with|mode|math|s> would not exceed 20 miles.\ 

        So we conclude that <with|font-shape|italic|Find-Way> satisfies the
        feasibility that Bilbo would walk at most 20 miles every day in the
        trip.

        <item><strong|Claim>. <with|font-shape|italic|Find-Way> satisfies the
        optimality criteria that he can finish his journey in the least
        number of days.

        <em|Contradiction Hypothesis>

        Let <with|mode|math|S>* be the optimal solution got from
        <with|font-shape|italic|Find-Way>. Assume that there is a better
        solution <with|mode|math|S> that require less days than solution
        <with|mode|math|S>* for Bilbo to finish the tour, there must be a day
        <with|mode|math|d>, in the entire trip such that Bilbo could walk
        more distance than <with|font-shape|italic|Find-Way> solution.\ 

        However, based on the fact that the distance between every
        consecutive pair of hotels would not exceed 20 miles and the
        algorithm we construct in <with|font-shape|italic|Get-Next> line 11,
        if in day <with|mode|math|d> solution <with|mode|math|S> Bilbo would
        walk more than the miles in solution <with|mode|math|S>*, then Bilbo
        have to walk more than 20 miles, in contradiction with the
        feasibility.

        So the contradiction hypothesis does not hold<emdash>no other
        solutions would be better than <with|mode|math|S>*,
        <with|font-shape|italic|Find-Way> satisfies the optimality criteria
        that Bilbo can finish his journey in the least number of days.
      </itemize-minus>
    </itemize-dot>

    <item>(3 points) After studying your algorithm for the previous problem,
    Bilbo realizes that, actually, the different hotels cost different
    amounts, and what he actually wants to do is minimize the total cost of
    his journey. (Luckily, his guidebook also lists the cost of each hotel.)
    He thinks of the following greedy algorithm: wherever he is, for each
    hotel within a day's walk of him (20 miles), he computes the ``cost per
    mile'' of staying there, dividing its cost by the amount of progress he
    would make by staying there; given this list of costs, he then chooses to
    spend his next night at the hotel with the best cost per mile.
    Demonstrate for Bilbo that being greedy can be costly, that is, describe
    an example where Bilbo's algorithm gives suboptimal performance.

    Suppose the route is as follows:

    <postscript|<tuple|<#89504E470D0A1A0A0000000D494844520000013A0000007A0802000000A00F08D30000062B7A5458745261772070726F66696C6520747970652065786966000078DAA5575B9224270CFCAF53F80848A0D771C42BC237F0F19DD03DE3998D0DDB6B77ED34D5142544662A619FF5C7EFFBF90D1F32E6A789B9866AC1A7450B4EDC78797DD012172A817B7AF7BD5BCAEFFD4F7BBF44FDFB838F7EF61F02F1ABA9849E73BFDE81F47D53F9F580DAEBB78DF70415BD3FC948C3ADB42F19C5FBF97C0754B3A66EA25399119E57A54AF89633594526B5D644FBFAC6CAD1E3351F34055D7C06968B1442DB59DB3BD3F33A9F85047DEDBFF9D7739377FCF3E58513F2A2F8B3A514FEDE5FF37D575FFDCFC703CBF2FDA3373ADD59E94BDF4F183BC43CFF85B1BBAC2F40F328F4BC077C7BE05EE46B727B4FDF7BDD012D9B426F7A7FD0E7E25F8130B0238F7A25A8B80C7F827BBB57E072603A208D5946E9B806B06780BAA9D1A4A4FDD0BA378306D26ABCD8D0320F1075FABC1A078F4B453B176DB61A758272AE03B2A8E8E5BD9F772E74E78D3BDF20C7CC93309409C1E80AE01FAEE7DF0CFABB6BEF5302048CFC96C76D50A18717A471683FDF18061268BF41950BF0C7F5EDF37C6AB461D881D9B1C02CFD15A20BBD583D7AAA97DB8A7182F62564B2F97AFF046A985B900C6AAA5151AA428A7260362200E92028A938D7C61D0C90084F24C9AD5605377E8A3A1FBC6374C7B2F0AB1F9E0426A46A3570133541566B02FD58736828A54A131115139790D4AAED515155D3636E69D59A89C100CC2D2CBD7A73719881BB87677054789F848685474426E64C444E7D12E3133D9D7BEDAD4BD76EDD7BF41C90CF6843860E1B3E62E4E459679B3275DAF41933172D4869B525CFD265CB57ACDCD0DAAEBB6DD9BA6DFB8E9D9FACD1BB847FBC7E81357AB3C697A933CE3E5943AFD9AB7DAE5E10E47006C6B81118B7C30004CD87B3E2D41A1FE60E67251855218C24E57033A92429B7A7B6452C9B3EB9FB8BB95FE2EDD1F6B7BCF1BF65EE39D4FD4FE62E6FCF922FBCFD84B5792C785CC65E5578302D15D58731C98E7FF07FF6E7E3E6D75ADDE17D2956DFFBB2A16B3CD681A9451DC0A3455D3212380064453D79AC295810E5149F580F5ECB12E0CA4C6709D987B53583809147E93A859BED1243DBE69A6AB5159A2E8AAAD59A63F443548E699010AFE5B0DA81DD96BAD180B05B3C2B82CD09D69993DAAC6B2488B6CD245ECB401E63EF9AB2D7E81DEE8E4D6C73B73D145E51A020C2660B6778AE0EA564B590E56D5B8A60D3563D2A61290BBE5B6781370FEC23473C94A248076A1E3CCF436897F7B3913F5435BBC6E4953D917511CF862DA012D4A23C06C2EA99D74ED7D039FB76A29908039239521DCA1E3D02CF249622A00F85A08205F580D29B9AD17602D6D95B899858A51E413703B61CA5294ACFA1EC18D6E3E6275677C74EBED73EB8AC222D0E26038E685B15BB93ADCDABFBE94DBC667B7B42673D9A3C5242C72ADD1CCAB4A3E6E638C3603D6D8E7AB01890AA26040DF2408ACE0EDC6D5A46D9D1C0004A88E2E9BA2AB40F6031FF508715CFA64B37F8608039CEFE088984A118703CEB0AAB406E5D6FB62E6DA2A0849FB1B9392089016A06C36D6C7637AC03E55CA0D03D16D0E48130486EB6B5C6EED0463F81DC133B4554076BE13E07EDCC61778E364B919ED830D60A54E498A88A3197EC3367EE0E7368067784106F07CE1360E31925BBEB0463E5CA4D4F58706C13D5BE0C372A6F3C853AF0D7C990D19C0736A305C3D28B11C81A5DAE9DA2BAC6EB88B0302D44828022D3B4B32B41AD0A0FC2D6B7105DBE16317538A4A3E03049830EE1B1A4304824C01D61EB382AEE2B0043EA40305F8B71543D21283AE33704DEE74695E158B3B467B9074E39E42F87C8B3090880AFF53E8566C0831B644E27D9B95191F728A601ABE782F4241F64C6D4C13BE4945805D426280E65B0754CC550638AB29F64586685585AF40AC6E1351074E04884E569E0305A5D80EA86F7059C02CEC40137022138A40CD871C040304D2C6ABDF84649091C398E66043680A3052A839EEE380AAC657DD7B38B200F5422ACF7E00828500669C0097261B80B536077817605BB1B304E980E6D1D08942E38652067980FD72ED22064AD1020EC8A638DB2E1E9C7BE916E6D079926B95DAD25360A080A221E829D5665542C6AD0CABA0284D8420D730797D832A837EC664E000DC82C20DB509928ECB3E0F3FF167CDDF6F9B8F9C51667B919CF9F3691465394A8BCE70000000373424954080808DBE14FE000001C2E49444154789CEDDD79581367FE00F00909106E08010496FB3E14105C0E1145C00BCF52B52A1657712DDB155744775DEDDA55C456AC07BA6AD16A8BA8557CACAC1794531E04E4A6800A724380908300091392C9CCEF8FF93D598A07670883EFE7AFCCCB9BC97748BE73BCF3CEFB92300C83000020020579070000C06881740500C200E90A008401D215000803A42B001006485700200C90AE004018205D01803040BA02006180740500C200E90A008401D215000803A42B001006485700200C90AE004018205D01803040BA02006180740500C200E90A008401D215000803A42B001006485700200C90AE004018205D01803040BA02006180740500C200E90A008401D215000803A42B001006485700200C90AE004018205D01803040BA02006180740500C200E90A008401D215000803A42B001006485700208C8F255D070707E51D02004C1481D3B5BFBF7FF495B76DDBC6E17064170C004C01A2A66B5A5A9A8787475B5BDB682AB7B5B53537376B6B6BCB3A2A00902942A66B4F4FCFD1A3475D5D5DD5D4D44653FFE1C387818181643259D68101804C11325DB3B3B34D4D4DFBFBFBD5D5D5DF57074190D7AF5F431084A2E89D3B7756AF5E3D850102804C10325D1F3C78B074E9D29D3B772A2929BDAF4E6B6B6B6868288AA2030303300C3B39393D7DFA94C1604C659C13C162B14A4A4A1004917720C03442BC749548245555550B162C58B76EDD07AA595A5A8684846018565656A6A3A3C36030F6EDDB77E7CE9D298B73DC300C3B7FFEBC9F9F5F7474745858586363A3BC239A1C1C0E07C3307947416CC44B570E87A3A4A4646A6A2A2DC10F41229108C3303E9F8FA2280441300C47474793C9E4BABABA254B96242424383B3BB7B4B4C82DEE51E37038D7AE5DCBCCCCCCC8C8F0F3F3CBCECE1ECDBBE2E2E29A9A9A641DDB44848484BC7AF56A6889582C4651542C164745453D7AF4485E811108F1D2B5B9B9592C165756564AD3F2CF7FFEF3C3870F972E5DFAD7BFFE75F9F2E557AE5C61B3D91B376E7CFCF83104415959594A4A4A858585C1C1C17FFFFBDFE51DFEC81A1A1A8442A19191118542090B0B5BB56AD5886F4151F4C68D1BCACACA5310DEB8696B6B0B0482A125111111E5E5E5757575F9F9F9414141F20A8C408897AEF5F5F50C0623343474FDFAF5FDFDFD0A0A0A151515B76EDD7274743432328A8F8FCFC8C8A0D3E9D6D6D65555551004858484B8BABA1A1919B1D9ECF6F6F6A2A2A2EEEE6E796FC4088C8D8DF117542A555F5F7FC4FA2525251A1A1AA3A929478A8A8A4317D3D2D2DEBC79E3E8E878F3E6CDE5CB974FF37DCD344191770063261289FCFCFC929292D6AE5DDBDBDB4BA552FBFBFBBFFCF24B6F6F6F1289D4DEDE8EFFD6BFFCF24B1A8D0641504848080441565656870F1FC64F89BFFAEAABE9FCCB2693C97893188AA28585852C162B38389842A1A028AAA0F0BBDD6B454585AEAEAE898949666666404000854261B3D9341A6D58B569A2BCBC7CE8626363A38E8E0E8661353535C78E1D935754C4321DBFD70FB3B2B2EAEEEE8661B8AFAF4F5555154190356BD6F8FAFA92C9640505055353D3B8B838BC9A8E8E8EF45D46464657AF5EADA8A8484E4E767575955FF823B3B2B2D2D5D5ADACAC5CB56AD59933672A2B2B310C4B4F4FFFE73FFF39ACE67FFFFBDFEBD7AF2308F2ECD9B3A0A0A0FCFCFCD9B367EFDFBF5F2E618F884422696A6A4A17C3C2C24C4D4D838383CBCACAD2D3D333323220088261F8EAD5ABD23A288A72B95CD081548A44B8C63A1886DDDDDD35343442434377EFDE2DEF70269F48245ABC7831994CDEB973676868285E1811113177EEDC4F3EF9A4B1B1B1A0A0203838D8CACA0AFF139BCD5EB66C597A7AFACE9D3B0302026EDFBE9D9B9B2BBFF0DF8DCFE72F5AB4E8D9B367C37AB61414147CFDF5D78181814E4E4E2B56AC686E6EF6F3F32B2929B97BF72E04414D4D4DCDCDCD140AE5C68D1B1FB869F7F120DEC9B08A8ACAE3C78F592C96BBBBBBBC639189969696969696C4C4447F7F7FBC0445D1E2E2E2FEFEFEF3E7CFDBD8D8B8BBBB6FDFBEDDCECECEC9C9E98B2FBEA8AFAFA7D1688D8D8D3C1E8FCBE5AE5FBF5EBEF1BF537575B5A1A1A1AAAAEAB0F2B4B4B4A0A0A0E8E8687C1186611B1B9B03070E2C5CB8F0C489135BB76E4D4A4A0A0909C14F1FA63CEA698778E90A4190858585858585BCA390953D7BF6585A5A0EFD65B3582C369B1D1313939393B369D3266565653E9FEFEDEDDDDCDC8C20089BCD7674746C6F6FF7F1F13974E8901C23FF80EAEA6A2B2B2B128934ACBCA9A969E7CE9DD2C58E8E8EDCDCDC7BF7EEB9B9B93D79F264EFDEBD2A2A2AD6D6D6ADADAD531BEF34259374150A852F5EBC58B870A12C563EE35128144B4BCBA125EAEAEAF1F1F1E6E6E6DBB66DC34B8E1F3F2EFDE9DBD8D8E8E9E9757575492492290E75F4CACACA962E5D3AAC1086E1EAEA6A7B7B7B69497373F3679F7DB67AF56A1289F4F3CF3FE3DDBCA954EAAC59B3A634DC690B9381CECE4E6767678140208B95CF78EBD7AF5FB06001DE0768F44A4B4B67CF9E9D9595F5EDB7DF565555C928B6F1816178EEDCB9F5F5F5C3CA8542E1962D5B8696080482818181B7DF8EA2A86C432408991C5DB5B5B5CDCCCC86DD679B49060606A854AA8CEE971C3870402C16E377A146CFCDCDEDC89123972F5FA6D1686F5F22CA97402050545494B68D49292B2B5FBF7E7D68C93B23A752A9320C8E5064D232CCE7F3BDBCBC9E3F7FAEA5A535E92B973B144577EFDECDE170222222C009FF682008525B5BEBE4E424EF40084F26C707FC16A8482492C5CAE5AEB5B5353D3D5D4F4FEFFBEFBF97772CC440A15040AE4E0A999C0CABA8A8E8EBEB0F0C0CC862E51004492412168BA5A6A6A6A1A1212D64B15862B1F803EFE270386C361B82A0AEAE2E1D1D9D9696160505053333332727A7B75B2C87D1D4D4943E5BDBD8D8C860307272723C3D3D27BC29D3D18B172FE6CD9B373DBB467DE464D54D62C58A15B6B6B67BF6ECC14F84EAEAEA20087AFDFAB5A1A1E168CE90391C0E8BC5EAEAEA1A7A010CC3B08A8A0A04414C2653515191CFE72B2929E16D864D4D4D6A6A6ABABABA784D3E9F2F140A452291969696F4BE3C7EB10E41108AA22412894422696969F5F6F6BEEF77C9E3F18442210CC31289442814E217E41004090482172F5E5028147373733535354343C3B973E74A87AA98356B969B9B9B34FFC964B2868606994CD6D4D4A4507EB773249148D33025442251505010954A4D4C4C343030907738C0EFC8245DBBBABABCBCBC3A3A3A1C1C1CA2A2A27A7A7AA45F3C8D46E372B9A35989AEAEAEA5A5E5D09EDF028100CF3D1289646060209148381C0EFE5C0E5E5FDA5081A228DE96889F968F6F2B2412098661288A2208326C58360683C166B3CDCCCC3A3A3AA49B23140AF3F2F260185652524251B4A5A545241231180C2A954A269369349A74D72391480607071515154D4D4D8D8D8D5555553FDC65C7CACA0A4FF877DECF50515119FA38A1B2B2F244F6026D6D6D7E7E7EBDBDBD7979798E8E8EE35E0F200B3249D7E4E4E40D1B36F8F9F9656565811192DE26140ABBBBBB1B1B1B875EDEF7F4F4A8A9A9F1783C4545454D4D4D1886F181E37A7A7A984CE6DB2B110804ADADAD300CF7F4F40C2D373030A052A942A1108220369B8D61189D4E373131793BD51514142C2D2D151414949595CDCDCDF1837F7171716A6A6A4B4BCBEDDBB7ADADAD353434A6E129C03BE1FBE861A730338C4CB6CDC8C8484D4D6DF3E6CD44F9A6A718954A3535351D7A481C37B158FCCE3602BC5B7C5757178AA27C3E7FE89FEAEBEBC562318220CDCDCDD2A12A6A6A6AF0177C3EBFA0A0C0DADAFAE0C183BDBDBD868686B366CD525454B4B3B3B3B0B0C077BEF6F6F60A0A0A262626E38B994422611836627BC158656565151515BDFD20C414E8EAEA3A76EC584747879A9ADAC58B17873EC930B9269AAE42A11045D161B7CB5C5C5C2C2C2CF4F5F527FD2B0186515454FC405BC03B9F13F4F5F5FDC00AFBFAFAFAFAFA2E5DBAA4ADAD0DC3F09B376F1004A9A9A9A9ABAB6332993D3D3D5D5D5D6D6D6D229148FAA58BC5621E8F271289D4D4D4D86CB6868606DECA802008994CEEE9E92193C9542A156F77209148341A8DC3E17878780CBDA1CA62B12008EAEFEFB7B0B02091480882FCE10F7F505252A252A9B6B6B6838383D2CB221A8D666D6D3DEC48A0A4A4A4ADAD5D5E5E9E9191D1D7D7979191819F5F60188620089D4E9F3B776E5353537B7BBB582C1EFAB3148BC55A5A5A8B172F1EF67F6032991515152626268E8E8E8A8A8ACECECE9A9A9AD2C691614E9E3C79F1E2457B7B7B3E9F0FC3B0ECD2754227C3BDBDBD5BB66C219148B76FDF1E3A28218BC50A0808F8D7BFFEF5E9A79F4E4690C0947AFBC1DA61F0AB7AE92282207D7D7D62B1181F7F071F8B07C3306565652A95DADBDB4B2693F1C483204824120D1B53E29D01B4B4B4480FF8C39494940885C2A1118A44A28686061313939A9A1A1717175F5F5F474747BC6F230CC3A5A5A53C1E0FAF49A7D3DDDCDCA4998F61586363636B6BEBFB425256561E1C1C2C2D2DE5F3F99D9D9D060606435B19F076137CFC9AD4D4541289E4E2E2F2E2C50BD93D3C34A174DDBF7FFF9933673C3C3C9E3C7932AC174E7F7FFFD0BB2C33128AA295959573E6CC01D7E772C7E3F1984C665E5EDE8E1D3B64F41142A110BF1128D5DEDE4EA552DBDADA060606C2C2C27C7C7C162F5E7CF8F0611905004113E8337CF7EE5D1F1F9F9B376FB2582CBC442814868484B4B7B78F7B9DC4F2E4C993A0A0A0C1C141790702C8198220D7AF5F8F8C8CCCCACA92E9078DF3E8CAE170020303CF9C39E3E4E4A4A7A7871732188CC0C0C0E2E2E20F8CD63D63C0301C1010A0A2A292999929EF58808FC5385B6E535252ACACAC162D5A24CD5508829A9A9A8C8D8DF1168519EF975F7EB1B1B1812048769DB700D94110848843AE8F335D8B8A8A8C8C8CA45D1470BFFDF69BBFBFFF881772F7EEDDCBC9C919DFE74E1FB76EDDDAB2650B8FC703CF8B10088661DDDDDD57AF5E0D0C0CBC71E386BCC319B371A6EBB66DDB7EFDF5D7B0B0B05F7EF9A5A7A707BFB9575D5DEDE0E0D0DEDE8EB7A1BF4F6C6CEC98E67A9C86DADBDB1B1A1A3C3C3C14141466D8BD6514450502817474F519034190CCCCCC1D3B76F8F9F9A5A5A51D3E7C78E3C68DF20E6AECC67DD5CBE572FFF39FFF2C5BB66CF6ECD99F7DF699BABABAAAAA6A5858D8860D1B3C3D3D333333A535EBEBEB77EDDAD5D8D88861585F5F9F8383434747C784AFBAE5E9C71F7FDCBD7B378661EEEEEEF28E65328944A2D0D0505B5B5B3B3BBB6BD7AEC93B9C49C066B3B3B2B28E1C39E2EFEFBF78F1625B5BDBC4C4447907357E131D4D4222915CB97265DDBA75F9F9F98E8E8EF85EF9DEBD7B8B162DC230ACAFAF0FBF079B90902010081004A9A8A8B0B3B38B8C8C6C6E6E9E8CF8E5402C162F5FBEFCFEFDFB972E5D9A356BD64C6A09EFEEEE8E8D8D653299E7CF9FDFBB77AFBCC39990B2B2B26DDBB67979796DD8B0E1ECD9B3D5D5D50D0D0DB367CF1EEB301D4321083289118EC3444FE40A0B0BBFF9E69BC8C8C83973E6E07787190C8689890997CBADAEAE0E0E0E5EB972A5AEAE6E7878B8AAAA6A6C6CECF2E5CB1515153D3C3CA6DB8807A3F7EAD5ABF2F2F2A4A4242693A9A6A646DC0D1906C3B0AAAAAA3D7BF6D0E9F4478F1E050606CA3BA209A150286BD6AC79FAF4E99D3B77F6ECD9E3E4E4949595656B6B3BD6613AA4F87CFECE9D3BA53D2EC6A4AFAFEFDEBD7BE3FBDCDF9948AE171515393B3BDFBC79532291F0F97C0707878C8C0C0B0B8B254B96A8AAAAA6A5A53D7AF4C8CCCCEC6F7FFB1B5EBFBBBBBBA4A464E5CA95D25BB544F4EF7FFFFBC4891378CF1E333333426FCB503C1ECFCECEAEAAAAEAECD9B36BD7AE9D79F793376FDE7CF9F2E571BFBDB3B373D5AA55F8F73E1AE5E5E5C5C5C5F8EBB4B4B4B56BD78EFBA3A5C679741D1818888B8B0B0F0F3F7AF428DE955F5151113FD4D0E9F475EBD6C130ECE9E9191C1CACACACBC64C912FC5D7A7A7AD6D6D62D2D2D010101C46D6D7AFAF4A98F8FCF0C6B6182200845515D5D5D2693F9F3CF3F9F3B776E860DC3DDDBDB5B5252B260C18271AF814EA75FBA746994DF3B97CBFDCB5FFE32F4D327A543EED8BAF8D7D6D6D6D4D4601876E1C205030383478F1E491FCB505252B2B0B03873E6CCC68D1B9B9A9A162E5C883FDE79E2C489A1037F686969DDBA75EBE1C38704ED4AD1D9D9D9DFDF3F67CE1C7C5122914CE7E142C7A4A3A3432010C4C7C76FD8B061E60DB2D5D2D2A2AEAE6E6B6B8B2FE28D2C9A9A9A1886C130DCDCDCCCE7F3FFF8C73F7E600D140A453AD518AEBEBE1E1F42B0AFAF4F414161E84FFAD4A9538B162D928E5C8F4FD43409C6742C7EF0E081AFAFEFD6AD5B939393DFBEEC7EF5EAD59D3B7766F61893090909E1E1E1D2456B6BEB57AF5EC9319E49949B9BEBE0E0505252F2C9279F383B3BDFBD7B57DE114DA653A74E1D3870007F5D5F5FEFEEEEBE70E1C2F4F4F467CF9EF9FBFBFBFAFA1E3C7810FFAB4824BA7FFF7E6969697171717676365EF8F2E5CBA4A424E9DAE2E3E3B3B3B33534345EBC78211008BEF8E28B458B16F5F6F6E27FE572B9EEEEEE9D9D9DC362181C1CE472B9F86B369B2D168B3B3B3BBBBABA46BF15634B571445070707477FFA3EF34447479797974B173FFFFCF37BF7EEC9319E49C4E572A3A3A3310C138BC58F1F3F363535158BC5F20E6AD2AC5DBB362121017F7DEDDAB5C8C8C875EBD65DB870A1A3A3C3DCDCFCF8F1E3F8E1A7B6B676E1C285F3E6CD5BB366CDAE5DBBACACAC984C26866157AF5EFDEAABAFF0B7F7F4F4F8F9F96DDAB4C9C1C1A1A1A1E1C183070505052E2E2EF8AD4A1E8F77F1E2456F6FEF888888BCBC3C8944B27DFBF6AEAEAE070F1E040404585959757575C1306C6F6F1F1414E4EFEFEFE8E8F8F0E1C3516EC5D84E864924D20CBBA4192B7C7A3BA9D3A74FCF984E973A3A3AF8D65128141E8F47A7D367D293462412497A51565D5DCDE170F6EEDDEBEDEDDDD6D6261008C2C3C3C964328AA2E7CE9D3337371F1C1C2493C9515151797979EAEAEA0281202121E1871F7EC0DF7EF7EEDDE6E6E64F3FFD545959B9AEAEEEE8D1A3F8C5113EC2D10F3FFC909898F8A73FFD293838984EA7575656FEF6DB6FBABABA2C160B45517575754D4DCD949494C1C1C19898180F0F8FD7AF5FEFDAB56BF1E2C5A3BAC530F9FB3180982E5EBC98969656545474F4E8516767E7FCFC7C79473469F087DD6B6B6BF1C555AB56656767D7D6D6A2285A5F5F6F696929140A310CABADADB5B1B1E9E8E8B87EFD7A6F6F2F83C1888C8C445154229148A720405174E5CA95717171DBB76F7FFCF8B19F9FDFF3E7CF4D4D4D636363A51FE7E2E252505080BF8E8E8E3E7EFC388661128964C99225DF7FFF3D8661515151292929D2FAFEFEFEFDFDFDA3D91090AEC0FFBB75EBD6BA75EBFCFCFCF6EDDBC76030E41DCE64128BC5DADADAA9A9A97856ECD9B3C7D3D373C78E1D128924252565D5AA5578351886479CAFA4A6A6C6DEDEBEAAAACAD5D5353131312E2EAEB6B6964EA7B7B5B549EB383939E1BB060441DCDCDC1A1A1A3EB04206833177EE5C3E9F3F9A0D01E90AFC0F8220F88810338C582C767171090C0CC42F2F6118663018300CE3AFA5CD3FA391999979F9F2650441B85C6E4C4C8C8B8B4B5858D8B265CB86D6397CF8B0F448CEE1703EDCD65356568637198C06F1A6630680B1924824161616111111070F1E9CC4D50A85422E97ABADAD2D140AC7DD590A4551914834CAE7BA40BA021F05A150A8A8A848F4C63390AE00401833AD279DAC7D246347343737979696CA3B0A603890AE63131E1E9E9B9B2BEF2864AEA4A4E4BBEFBE937714C070205D474528140A04027CE63B0683D1D7D727EF88648BC3E17C784810402E40BA8E4A6A6AEA891327C864724444C4575F7DB572E54A794724130882C4C6C6E20F70E3D37600D3CA4C9EFF6712656767E7E4E4686A6A1A1B1BDBDADA2627270FAB909898A8A5A5B572E54ABCED91C562B1582C3B3B3B623545666666C6C5C5191B1B1B1A1AF2F97C9148F491F7399D6EC0D1755468341A8661BDBDBD3636364C26F3EDEE9D767676FBF7EF2F28288020A8B0B0D0D7D777F5EAD5F822812008121D1D5D515151585898979757585828EF8880DF01E93A321E8F979292C2E7F3C3C3C37574746018866178581D4F4F4F5555550A8522168B8F1D3B969C9C9C949474FAF469B9043C6EC1C1C1D6D6D63FFDF453505090B5B5F5879FFF04A61E48D791C5C4C46CDAB4C9D1D131373717C3307D7DFDB78FAE6565651004595959BD79F386C964FEF4D34F172E5CA8A8A8C0275693A993274F0E9B2D7ADCBABBBB4F9D3A656363636464646D6DFDCEAE363D3D3DC9C9C96F5F0E0053005CBB8E202F2FAFBEBEFEDB6FBF6D6F6F87619844223199CCC6C6467D7DFDA1A307BC7CF99242A1CC9B376FEFDEBDB366CD0A0B0BC3302C3A3AFA7D530C4EA22D5BB6686B6B4F7C3D030303DBB66D0B0B0B4B4F4FA75028028120272787C5620507074B774F088244444450A9D4CACACAA2A2A2618F1302B2068EAE23C8CDCD150A8557AE5C61B3D9BFFEFAEBEEDDBB190C464444446868E8D0B9CF4343430B0B0BBDBDBDF1D913310C8B8A8ADABB77EF140CE9646C6C3C290D5AA74E9DD2D7D75FBD7A757777F777DF7D575252F2E38F3FC6C7C73F79F2445AA7A4A4A4BABA3A2121C1C8C868FEFCF9D2722E973B6C1277401640BA8E203232F2F3CF3FEFE8E8E0F1786A6A6AC78E1DD3D5D53D7EFC785B5BDBD04956F021945FBF7EBD63C70E4F4FCF888888A8A8A8152B564C7DC0393939E368E2CACCCC4C4D4D757070D8BA756B6565A58B8B8BB9B9F9E5CB97251289A1A1A1B45A4141C1E6CD9B0B0B0B7373739D9D9DF1C2478F1ECD9F3FDFC5C585CBE54EDA6600EF34FA47873E66FDFDFD212121D1D1D1F85821FBF6EDFBC73FFE211D954A20109C3D7BD6C7C7272D2D0D2FC11F77968B818101814030A6B72008B266CD1A07078783070F3E7CF8D0C4C4A4B4B4544F4F2F3333D3CBCB6BE81030212121376FDEF4F6F6D6D3D3C337BFA0A0C0D5D5F5CD9B379E9E9ED267B8011901D7AEA3229148DEBC79131010606868686868989F9F8FCF968DFF552C16373535C5C4C4F8FBFBE325D2F9B9A7DE3806A32193C9F7EFDF2791482412099F0F0582207B7BFB73E7CE1D3B768C42F9DF8F0445D193274FFAF8F8181B1BE39B7FE8D0A1B8B8B82B57AE343535999B9B4FDE7600EF00D27564A5A5A53131310101013C1EAFA9A9A9BFBFFFD0A1439A9A9AD20A5A5A5A67CF9E9563841337F41A9B42A1D0E9F48E8E8E254B96487740B8D3A74F575656767575BD7AF50A82A0D2D2520441F0FDD7AD5BB788D527848840BA8ECCD2D21286E1F2F2F2A2A2A2E2E2E2818181808000790735F9525353070606BCBCBC0C0C0C8A8A8ABABBBBF7EFDF3F2C03CDCDCDCDCDCDA3A3A3F176A6C2C2421D1D9DE8E8E82B57AED8DBDBCB29F08F08686A1A998E8E4E4A4ACAFAF5EBD7AE5D7BE0C0011A8D36235B41CBCBCB4F9D3AF5CD37DFD4D5D5959595595A5ABEAF66515191A9A92904413E3E3E743AFDC891232057A70638BA8E8AB2B2B28A8A0A8BC5F2F2F292482433325D232323CDCDCD69345A7E7E7E6C6C6C6E6E6E6B6B2B3E43FC30EAEAEA1616161004B9B9B95DBD7A75CA23FD7881A3EB68B9BABA32994C2E976B61613159BD88A6153535B54D9B36CD9E3D1B7F16874422BD7CF9F27D95C165AA5C8C335D1104F9D81EB07275754D4D4DA5D1685E5E5E494949F20E4786783C5E7777B79595D5DB5DA371D7AF5F9F82DE5AC0DBC85F7FFDF538DE565C5C9C9999E9E6E636D9F14C5F2412494343038220272727535353333333794724438181814D4D4D62B1F89DBDFC093A1DD90C30FEA1D5300C93DE7804669EE7CF9FC7C7C7DFB97347DE8100FF33FE6B5790AB339B9393536F6FEF4732941C5180A626E0DDB4B5B5E7CF9FDFD9D929EF4080FF01E30C03EF85A2E8CC9B249ED040BA020061807D27001006485700200C90AE004018205D01803040BA02006180740500C200E90A008401D215000803A42B001006485700208CFF03B84DF01A262051D50000000049454E44AE426082>|png>|*5/8|*5/8||||>

    Based on the greedy algortihm he constructs, in the very beginning, hotel
    <with|mode|math|A> is his next destination since
    <with|mode|math|<frac|30|6m>\<less\><frac|90|6m+8m>>, and the second
    hotel he would arrive would be <with|mode|math|B> since within 20 miles,
    <with|mode|math|B> is the only hotel. In this case, Bilbo would live in 2
    hotels spending 120. But the optimal solution would be walk through hotel
    <with|mode|math|B> in his first day and that would only charge him
    <with|mode|math|90>.

    <item>(4 points) Find a dynamic programming algorithm for Bilbo's
    problem. Make it clear to Bilbo why it works, including an explanation of
    the meaning of any tables you ask Bilbo to construct. (Your solution for
    this part shFind-MinCost-Wayould look like an explanation, not a proof).

    <\itemize-dot>
      <strong|<em|<item>DP Algorithm>>

      The pseudocode is as follows:

      <with|font-base-size|9|<\code>
        01 <math|s\<leftarrow\>>departure point

        02 <math|t\<leftarrow\>>termination point

        03 <math|N\<leftarrow\>>total number of hotels

        04 label each hotel in the route from <math|s> to <math|t> as 1 to
        <math|N>

        05 construct a <math|(N+1)> array ``<em|hotels>'' in which

        06 \ \ \ each element <math|i> stores the minimum cost from <math|s>
        to hotel <math|i>

        07 construct a <math|(N+1)> array ``<with|font-shape|italic|hops>''
        in which each element <math|i> stores

        08 \ \ \ the previous hotel number Bilbo would live in before
        arriving hotel <math|i>

        09

        10 def <name|<with|font-shape|italic|Find-MinCost-Way>>(<math|t>):

        11 \ \ \ <em|hotels>[0]<math|\<leftarrow\>0>

        12 \ \ \ <em|hops>[0]<math|\<leftarrow\>s>

        13 \ \ \ for <math|j> from 1 to <math|N> do:

        14 \ \ \ \ \ \ \ for each hotel <math|i> within 20 miles before
        location <math|j>:

        15* \ \ \ \ \ \ \ \ \ \ hotels[<math|j>] <math|\<leftarrow\>>
        min{hotels[<math|i>] + <math|j>.cost}

        16 \ \ \ \ \ \ \ \ \ \ \ hops[<math|j>] <math|\<leftarrow\>>hotel
        index of min{hotels[<math|i>]}

        17 \ \ \ \ \ \ \ end

        18 \ \ \ end

        19 \ \ \ for each hotel <math|k> within 20 miles before <math|t> then
        do:

        20 \ \ \ \ \ \ \ return min{hotel(<math|k>)}

        21 \ \ \ end

        22 end
      </code>>

      <strong|<em|<item>Correctness>> (Proof by Induction)

      <with|font-shape|italic|Base Case>:

      If the distance from <math|s> to <math|t> is less than 20 miles, assume
      there is <math|c> hotels in the route. Then from <math|s> to hotel
      <math|i> (<math|i> ranges from 1 to <math|c>), the optimal cost of
      every intermediate destination, hotel <math|i>, is the cost of hotel
      <math|i> itself. Also, we have set hotel number 0 is of cost 0 and
      therefore the minimum cost from departure point to destination is of
      cost 0. Base case holds.

      <with|font-shape|italic|Inductive Hypothesis>:

      Assume in intermediate hotel <math|k>, within its previous 20 miles,
      there were <math|m> hotels and from <math|s> to hotel <math|i>
      (<math|i> ranges from <math|k-m> to <math|k-1>) we have constructed
      optimal route for it.\ 

      We need to prove that we would have the minimal cost starting from
      <math|s>, ending at hotel <math|k>.

      In hotel <math|k>'s previous 20 miles, there are no more than
      <math|m+1> hotels. So based on our inductive hypothesis, from <math|s>
      to hotel <math|i> (<math|i> ranges from <math|k-m> to <math|k-1>), we
      have constructed optimal route for it. According to line 15, for the
      route from <math|s> to hotel <math|k>, we could find the optimal route
      by choosing the minimal cost from the previous <math|m> hotels' route
      and add hotel <math|k>'s cost, which will still be the minimum cost.

      So we could find the optimal route from <math|s> to the termination.
    </itemize-dot>

    \;
  </enumerate-numeric>
</body>

<\references>
  <\collection>
    <associate|auto-1|<tuple|1|1>>
  </collection>
</references>

<\auxiliary>
  <\collection>
    <\associate|toc>
      <vspace*|1fn><with|font-series|<quote|bold>|math-font-series|<quote|bold>|Problem
      1> <datoms|<macro|x|<repeat|<arg|x>|<with|font-series|medium|<with|font-size|1|<space|0.2fn>.<space|0.2fn>>>>>|<htab|5mm>>
      <no-break><pageref|auto-1><vspace|0.5fn>
    </associate>
  </collection>
</auxiliary>