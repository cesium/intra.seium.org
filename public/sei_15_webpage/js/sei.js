angular.module('sei-app',['angular-carousel'])
.controller('eventCtrl',['$scope','$rootScope',function($scope,$rootScope){
    $scope.eventSlides = [
        {file:'/sei_15_webpage/events/14-fev.html', day:'14 Fev', weekday:'Sábado'},
        {file:'/sei_15_webpage/events/16-fev.html', day:'16 Fev', weekday:'Segunda'},
        {file:'/sei_15_webpage/events/17-fev.html', day:'17 Fev', weekday:'Terça'},
        {file:'/sei_15_webpage/events/18-fev.html', day:'18 Fev', weekday:'Quarta'},
        {file:'/sei_15_webpage/events/19-fev.html', day:'19 Fev', weekday:'Quinta'},
        {file:'/sei_15_webpage/events/20-fev.html', day:'20 Fev', weekday:'Sexta'},
        {file:'/sei_15_webpage/events/21-fev.html', day:'21 Fev', weekday:'Sábado'},
    ];
    $scope.carouselEvents = 0;
    var counter = 0;
    $scope.marteladaIncludeFeito = function(){
        counter++;
        if (counter=== $scope.eventSlides.length){
            window.marteladaRefresh();
        }
    }

    $rootScope.eventGoto = function(page){
        $scope.carouselEvents = page;
    }
}])
.controller('speakerCtrl',['$scope','$window','$rootScope',function($scope,$window,$rootScope){
     var speakers =
        // slide 01#
        [
            {pic:'/sei_15_webpage/img/speakers/hpinto.jpg', name:'Hélder Pinto', position:'3D Environment Artist' , enterprise:[{name:'Blizzard', enterpriseUrl:'http://eu.blizzard.com/'}], web:'http://www.helderpinto.com/' , twitter:'https://twitter.com/HelderHP', github:'',
                about:'Começou carreira profissional na indústria dos vídeo jogos em terras Lusitanas na Seed Studios, no ano de 2007, onde trabalhou no jogo Under Siege Game, partindo depois para a Alemanha, onde ajudou a embelezar os ambientes de Crysis 2 e 3 antes de finalmente começar na Blizzard na Califórnia onde de momento trabalha no jogo Overwatch.'},
            {pic:'/sei_15_webpage/img/speakers/lfonseca.jpg', name:'Luís Fonseca', position:'Lead Interactive Developer' , enterprise:[{name:'X-Team',enterpriseUrl:'http://x-team.com/'}], web:'http://luispedrofonseca.com/' , twitter:'https://twitter.com/lpfonseca', github:'',
                about:'Com mais de uma década de experiência num leque muito variado de tecnologias, desde Unity a Objective-C passando pelo Javascript e Flash, focou-se fortemente, nos últimos anos, em desenvolvimento de jogos e aplicações mobile. Faz parte da X-Team desde 2008 onde trabalha, em parceria, para empresas como RIOT Games, Dreamworks, FOX Broadcasting, Microsoft, etc., criando projectos que alcançam todos os dias milhões de utilizadores.'},
            {pic:'/sei_15_webpage/img/speakers/fmendes.jpg', name:'Francisco Mendes', position:'Entrepreneur & Creator' , enterprise:[{name:'Bee Very Creative',  enterpriseUrl:'https://beeverycreative.com/'}], web:'https://www.beeverycreative.com' , twitter:'https://twitter.com/fmendes75/', github:'',
                about:'Empreendedor apaixonado por tecnologia. Licenciado em Engenharia Electrónica e Telecomunicações e pós-graduado em Engenharia de Automação Industrial, ambos pela Universidade de Aveiro, começou a sua carreira profissional como Engenheiro de I&D e posteriormente como diretor de Hardware. No final de 2010, juntou-se a Jorge Pinto e fundaram a bitBOX Electronic Systems na incubadora de empresas da Universidade de Aveiro, que mais tarde tornou-se na BEEVERYCREATIVE, a empresa que criou a primeira impressora 3D portuguesa.'},
            {pic:'/sei_15_webpage/img/speakers/rmachado.jpg', name:'Roberto Machado', position:'CEO' , enterprise:[{name:'Group Buddies',  enterpriseUrl:'https://groupbuddies.com/'}], web:'http://groupbuddies.com/' , twitter:'https://twitter.com/rmdgb', github:'https://github.com/rmdmachado',
                about:'Engenheiro Informático de formação pela Universidade do Minho, tem muita experiência em Gestão e Empreendedorismo. Sempre teve especial interesse na criação de novos projectos. Atualmente é CEO da Group Buddies, uma empresa que desenvolve produtos web e mobile, onde tem a oportunidade de gerir um grupo de profissionais apaixonados pelo mundo da Web.'},
            {pic:'/sei_15_webpage/img/speakers/mpalhas.jpg', name:'Miguel Palhas', position:'Developer & SysAdmin' , enterprise:[{ name:'Group Buddies',  enterpriseUrl:'https://groupbuddies.com/'}], web:'' , twitter:'https://twitter.com/Naps62', github:'https://github.com/naps62',
                about:'Formado na Universidade do Minho, mantém ainda a sua paixão por alta performance e Game Development. Juntou-se à Group Buddies para poder continuar a experimentar novas tecnologias e trabalhar em projectos aliciantes. Fez parte da organização da primeira RubyConf Portugal e é um contribuidor extremamente activo para a comunidade de Open Source'},

            {pic:'/sei_15_webpage/img/speakers/gpoca.png', name:'Gabriel Poça', position:'Developer' , enterprise:[{name:'Group Buddies',  enterpriseUrl:'https://groupbuddies.com/'}], web:'http://gabrielpoca.com/' , twitter:'https://twitter.com/gabrielgpoca', github:'https://github.com/gabrielpoca',
                about:'Ninguém sabe realmente muito sobre ele mas diz-se que estudou na Universidade do Minho, que é viciado em software e que o seu primeiro tweet ocorreu no dia 13 de Maio de 2010. Consta que faz magia e tem tiques nervosos.'},
            {pic:'/sei_15_webpage/img/speakers/jjusto.jpg', name:'João Justo', position:'Developer' , enterprise:[{name:'Group Buddies',  enterpriseUrl:'https://groupbuddies.com/'}], web:'' , twitter:'https://twitter.com/jpjustonunes', github:'https://github.com/joaojusto',
                about:'Estudante de Engenharia de Informática e Computação na U.P. Os seus principais interesses são aplicações móveis e jogos. Recentemente começou a aprender e a ganhar uma especial curiosidade por tecnologias web, tendo entrado para a Group Buddies como apprentice, onde acabou por ganhar um lugar como developer.'},
            {pic:'/sei_15_webpage/img/speakers/rdescoffier.png', name:"Rafael D'Escoffier", position:'Developer' , enterprise:[{name:'BloomIdea',enterpriseUrl:'http://bloomidea.com/'}], web:'http://bloomidea.com/' , twitter:'', github:'',
                about:'Estudante de Engenharia Informática na Universidade do Minho e programador na BloomIdea, com foco especial no desenvolvimento de soluções na área das aplicações móveis. Otimista incurável e geek praticante, apaixonado pela tecnologia, natureza e desporto.'},
            {pic:'/sei_15_webpage/img/speakers/pvieira.jpg', name:'Paulo Vieira', position:'Developer' , enterprise:[{name:'iMobileMagic',  enterpriseUrl:'http://www.imobilemagic.com/'}], web:'http://www.imobilemagic.com/' , twitter:'https://twitter.com/imobilemagic', github:'',
                about:'Licenciado em Engenharia Informática pela Universidade do Minho, ao longo dos anos, tem estado envolvido na maioria dos projetos e produtos em que a ImobileMagic tem trabalhado, com um foco particular em desenvolvimento de soluções multimédia para vários clientes e no produto de localização e proteção familiar PhoneNear Family Safety. Tem uma experiência já muito vasta em aplicações móveis e, em particular, no ecossistema iOS'},
            {pic:'/sei_15_webpage/img/speakers/fcosta.jpg', name:'Francisco Costa', position:'CEO & Founder', enterprise:[{name:'Tricubo,',enterpriseUrl:'https://tricubo.com/'}, {name:'Chique,',enterpriseUrl:'https://chique.pt/'}, {name:'TYMR,',enterpriseUrl:'https://tymr.com/'}, {name:'Venture FC',enterpriseUrl:'https://venturefc.co/'}], web:'https://franciscocosta.com/' , twitter:'https://twitter.com/franciscocosta', github:'',
                about:'Empreendedor de sucesso, licenciado em Engenharia de Sistemas e Informática pela Universidade do Minho. Apaixonado por tecnologia, conta já com mais de uma década de experiência e muito sucesso acumulado em diversas áreas como E-Commerce, Social Shopping e Digital Marketing'},
            {pic:'/sei_15_webpage/img/speakers/nfernandes.png', name:'Nuno Fernandes', position:'D&R Director' , enterprise:[{name:'Eurotux',enterpriseUrl:'http://eurotux.com/'}], web:'http://www.eurotux.com' , twitter:'', github:'',
                about:'Licenciado pela Universidade do Minho em Engenharia de Sistemas e Informática é actualmente Diretor de Investigação e Desenvolvimento da Eurotux Informática. Co-Autor do livro Apache Instalação, Configuração Gestão Servidores Web, editado pela FCA, tem sido responsável pela implementação de diversos projectos de infra-estruturas tecnológicas de grande porte.'},
            {pic:'/sei_15_webpage/img/speakers/rfiqueira.jpg', name:'Rui Figueira', position:'Developer' , enterprise:[{ name:'Vilt',  enterpriseUrl:'http://www.vilt-group.com'}], web:'http://www.vilt-group.com/en/' , twitter:'', github:'https://github.com/ruifigueira',
                about:'Tem 10 anos de experiência em desenvolvimento web, principalmente em Java. Adora programar e automatizar tarefas aborrecidas (de aborrecido a divertido), e por isso criou o Minium, uma ferramenta para automatização de tarefas e testes web no browser.'},
            {pic:'/sei_15_webpage/img/speakers/nhenriques.jpg', name:'Norberto Henriques', position:'Especialista de UX' , enterprise:[{name:'WeDo',enterpriseUrl:'http://www.wedotechnologies.com/pt/'}], web:'https://www.linkedin.com/in/norbertohenriques' , twitter:'', github:'',
                about:'Iniciou a sua atividade durante o seu percurso académico, em projetos de business intelligence com a Oracle e Portugal Telecom. Desde então tem estado ligado à investigação e desenvolvimento em áreas relacionadas com aplicações para a Internet, multimédia e usabilidade. Foi colaborador no Instituto Politécnico de Leiria e foi responsável pela U.C. de Desenho da Interação dos cursos de Engenharia Informática e Informática para a Saúde durante vários anos. Em 2014 integrou a equipa de User Experience da WeDo Technologies, onde é atualmente Especialista de UX.'},
            {pic:'/sei_15_webpage/img/speakers/rantunes.jpg', name:'Rui Antunes', position:'Fundador FPV Portugal' , enterprise:[{name:'FPV',enterpriseUrl:'http://fpvportugal.com/'}], web:'http://fpvportugal.com/' , twitter:'', github:'',
                about:'Sempre se interessou com tudo o que estava relacionado com tecnologia e desde alguns anos que tem experiência em aeromodelismo, há cerca de 4 anos começou a ter contacto com multirotores. Actualmente frequenta o 2o ano de Engenharia Informática na Escola Superior de Tecnologia de Castelo Branco.'},
            {pic:'/sei_15_webpage/img/speakers/nsousa.jpg', name:'Nuno Sousa', position:'Developer' , enterprise:[{name:'Bitreserve',enterpriseUrl:'https://bitreserve.org/'}], web:'' , twitter:'http://twitter.com/nunofgs', github:'https://github.com/nunofgs',
                about:'Nuno Sousa é actualmente responsável pelas operações de Bitcoin na Bitreserve e segue o desenvolvimento das cripto-moedas desde o início.A sua curiosidade levou-o a focar-se no campo das cripto-moedas e na revolução do dinheiro digital, onde tenta concentrar as suas contribuições para a comunidade open-source.'},
            {pic:'/sei_15_webpage/img/speakers/tribeiro.jpg', name:'Tiago Ribeiro', position:'Developer' , enterprise:[{name:'Bitreserve',enterpriseUrl:'https://bitreserve.org/'}], web:'http://tiagoribeiro.net/' , twitter:'https://twitter.com/_fixe', github:'https://github.com/fixe#_=_',
                about:'Tiago Ribeiro formou-se em LESI, tendo estado envolvido em tecnologias web durante os últimos 10 anos. Em 2008, co-fundou a Seegno onde liderou o desenvolvimento de vários projectos internacionais. Em finais de 2013, participou na génese da Bitreserve, com a qual tem vindo a colaborar enquanto Lead Developer, com um principal foco no desenvolvimento da API e infraestrutura tecnológica. É um entusiasta do open-source e contribui activamente para diversos projectos.'},
            {pic:'/sei_15_webpage/img/speakers/rmarinho.jpg', name:'Rui Marinho', position:'Developer' , enterprise:[{name:'Bitreserve',enterpriseUrl:'https://bitreserve.org/'}], web:'' , twitter:'https://twitter.com/ruipmarinho', github:'github.com/ruimarinho' ,
                about:'Rui Marinho co-fundou a Seegno em 2008 e desde então participou em múltiplos projectos com as mais variadas tecnologias. No final de 2013 junta-se à equipa fundadora de Bitreserve, na qual é actualmente um dos responsáveis pelo desenvolvimento de serviços de backend. Interessado em performance, escalabilidade e segurança, é também um ávido contribuidor open-source, tanto como autor como colaborador em diversos projectos.'},

        ];

        $scope.$watch(function(){
            return $window.innerWidth;
        }, function(value) {
            if ($window.innerWidth < 768) {
                $scope.speakerSlides = [];
                for (var i = 0; i< speakers.length; i++) {
                    $scope.speakerSlides.push([speakers[i]]);
                };
            } else {
                $scope.speakerSlides = [];
                for (var i = 0; i< speakers.length; i = i + 3) {
                    $scope.speakerSlides.push([]);
                };
                for (var i = 0; i< speakers.length; i++) {
                    $scope.speakerSlides[Math.trunc(i/3)].push(speakers[i]);
                };
            }
        });

    $rootScope.speakerGoto = function(speakerName){
        for (var i = $scope.speakerSlides.length - 1; i >= 0; i--) {
            for (var j = $scope.speakerSlides[i].length - 1; j >= 0; j--) {
                if ($scope.speakerSlides[i][j].name === speakerName) {
                    $scope.carouselSpeakers = i;
                }
            };
        };
    }
    $scope.carouselSpeakers = 0;
}])

.controller('organizationCtrl',['$scope','$window',function($scope,$window){
    var staffs= [
        // slide 01#
            {pic: '/sei_15_webpage/img/staff/asantos.jpg', name:'André Santos', position: 'Presidente', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/62Gerente', github: 'https://github.com/62Gerente',linkedin:'http://pt.linkedin.com/in/62gerente'},
            {pic: '/sei_15_webpage/img/staff/mpinto.jpg', name:'Miguel Pinto', position: 'Vice Presidente', enterprise: 'Minho', facebook:'https://www.facebook.com/mcpinto98', twitter: '', github: 'https://github.com/miguelpinto98',linkedin:'https://pt.linkedin.com/in/miguelpinto98'},
            {pic: '/sei_15_webpage/img/staff/pduarte.jpg', name:'Pedro Duarte', position: 'Vice Presidente', enterprise: 'Minho', facebook:'https://www.facebook.com/pedrodpduarte870', twitter: 'https://twitter.com/pedroduarte870', github: 'https://github.com/pedroduarte870',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/pmaia.jpg', name:'Pedro Maia', position: 'Tesoureiro', enterprise: 'Minho', facebook:'', twitter: '', github: 'https://github.com/PedroMaia',linkedin:'https://pt.linkedin.com/in/maiarib'},
            {pic: '/sei_15_webpage/img/staff/pbarros.jpg', name:'Patrícia Barros', position: 'Secretária', enterprise: 'Minho', facebook:'', twitter: '', github: 'https://github.com/7patricia',linkedin:'https://pt.linkedin.com/in/7patricia'},
            {pic: '/sei_15_webpage/img/staff/fmendes.jpg', name:'Fernando Mendes', position: 'Diretor do Centro de Apoio ao Open Source', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/fribmendes', github: 'https://github.com/frmendes',linkedin:'https://pt.linkedin.com/in/fribmendes'},
            {pic: '/sei_15_webpage/img/staff/maragao.jpg', name:'Martinho Aragão ', position: 'Vice Diretor do Centro de Apoio ao Open Source', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/martinhoaragao', github: 'https://github.com/martinhoaragao',linkedin:'https://pt.linkedin.com/in/martinhoaragao'},
            {pic: '/sei_15_webpage/img/staff/fneves.jpg', name:'Francisco Neves', position: 'Diretor do Departamento Pedagógico', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/fntneves', github: 'https://github.com/fntneves',linkedin:'https://www.linkedin.com/in/fntneves'},
            {pic: '/sei_15_webpage/img/staff/fgomes.jpg', name:'Fábio Gomes', position: 'Vice Diretor do Departamento Pedagógico', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/SHIFTBASIC', github: 'https://github.com/MrFabio',linkedin:'https://www.linkedin.com/profile/view?id=353827731'},
            {pic: '/sei_15_webpage/img/staff/tcunha.png', name:'Tiago Cunha', position: 'Diretor do Departamento Recreativo', enterprise: 'Minho', facebook:'https://www.facebook.com/Apocalipse.113', twitter: '', github: '',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/pfaria.jpg', name:'Pedro Faria', position: 'Vice Diretor do Departamento Recreativo', enterprise: 'Minho', facebook:'https://www.facebook.com/NoventaESeis', twitter: '', github: '',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/ggoncalves.jpg', name:'Gil Gonçalves', position: 'Vice Diretor do Departamento Recreativo', enterprise: 'Minho', facebook:'https://www.facebook.com/gil.goncalves.161', twitter: '', github: '',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/foliveira.jpg', name:'Filipe Oliveira', position: 'Diretor do Departamento de Comunicação e Imagem', enterprise: 'Minho', facebook:'https://www.facebook.com/filipecosta.90', twitter: '', github: '',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/mmedeiros.jpg', name:'Mariana Medeiros', position: 'Vice Diretora do Departamento de Comunicação', enterprise: 'Minho', facebook:'https://www.facebook.com/mim063', twitter: '', github: 'https://github.com/Mariana63',linkedin:'https://pt.linkedin.com/in/mariana63medeiros'},
            {pic: '/sei_15_webpage/img/staff/jsimao.jpg', name:'Jorge Simão', position: 'Vice Diretor do Departamento de Imagem', enterprise: 'Minho', facebook:'', twitter: '', github: '',linkedin:'http://pt.linkedin.com/in/jorgepedrosimao'},
            {pic: '/sei_15_webpage/img/staff/psousa.jpg', name:'Paulo Sousa', position: 'Diretor do Dep. de Relações Externas e Parcerias', enterprise: 'Minho', facebook:'https://www.facebook.com/34chronos', twitter: '', github: 'https://github.com/prsousa',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/msantos.jpg', name:'Mário Santos', position: 'Vice Diretor do Dep. de Relações Externas e Parcerias', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/MarioSantos125', github: 'https://github.com/Galay125',linkedin:'https://lnkd.in/A7mvHm'},
            {pic: '/sei_15_webpage/img/staff/spinto.jpg', name:'Serafim Pinto', position: 'Vogal', enterprise: 'Minho', facebook:'', twitter: '', github: 'https://github.com/serafimpinto',linkedin:'http://pt.linkedin.com/in/serafimpinto'},
            {pic: '/sei_15_webpage/img/staff/pcarneiro.jpg', name:'Pedro Carneiro', position: 'Vogal', enterprise: 'Minho', facebook:'https://www.facebook.com/pedrosfdcarneiro', twitter: 'https://twitter.com/pedrosfdc', github: 'https://github.com/pedrosfdcarneiro',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/sferreira.jpg', name:'Sandra Ferreira', position: 'Vogal', enterprise: 'Minho', facebook:'https://www.facebook.com/sandra.ferreira.96742', twitter: '', github: '',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/mleite.jpg', name:'Mário Leite', position: 'Vogal', enterprise: 'Minho', facebook:'https://www.facebook.com/mario.leite.80', twitter: '', github: 'https://github.com/maleite',linkedin:'https://www.linkedin.com/in/marioleite80'},
            {pic: '/sei_15_webpage/img/staff/dcarvalho.jpg', name:'Daniel Carvalho', position: 'Assembleia Geral', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/dapcarvalho/', github: 'https://github.com/Insatisfeito',linkedin:'https://pt.linkedin.com/in/dapcarvalho/'},
            {pic: '/sei_15_webpage/img/staff/rbranco.jpg', name:'Ricardo Branco', position: 'Assembleia Geral', enterprise: 'Minho', facebook:'https://www.facebook.com/ricardobranco28', twitter: '', github: 'https://github.com/ricardobranco',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/apimenta.jpg', name:'André Pimenta', position: 'Conselho Fiscal', enterprise: 'Minho', facebook:'https://www.facebook.com/pimenta53', twitter: '', github: '',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/pleite.jpg', name:'Pedro Leite', position: 'Conselho Fiscal', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/pmcleite', github: 'https://github.com/pmcleite',linkedin:'https://www.linkedin.com/in/pmcleite'},
            {pic: '/sei_15_webpage/img/staff/roliveira.jpg', name:'Rui Oliveira', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/rui.oliveiras', twitter: '', github: 'https://bitbucket.org/ruioliveiras',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/jcosta.jpg', name:'João Costa', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/arnaldo.asturias.9', twitter: '', github: 'https://github.com/joaofcosta',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/pcardoso.jpg', name:'Paulo Cardoso', position: 'Membro', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/HeadlessHeader', github: 'https://github.com/pcardosolei',linkedin:'https://pt.linkedin.com/in/pcardosolei/'},
            {pic: '/sei_15_webpage/img/staff/jarantes.jpg', name:'Joana Arantes', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/joana.arantes.10', twitter: '', github: 'https://github.com/joanaarantes',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/smendes.jpg', name:'Susana Mendes', position: 'Membro', enterprise: 'Minho', facebook:'', twitter: 'https://twitter.com/Su__Mendes', github: '',linkedin:'https://www.linkedin.com/pub/susana-mendes/43/8b8/906'},
            {pic: '/sei_15_webpage/img/staff/bferreira.jpg', name:'Bruno Ferreira', position: 'Membro', enterprise: 'Minho', twitter: 'https://twitter.com/chalkos', github: 'https://github.com/chalkos',linkedin:'https://pt.linkedin.com/in/chalkos'},
            {pic: '/sei_15_webpage/img/staff/pcosta.jpg', name:'Pedro Costa', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/pedrocosta92', twitter: 'https://twitter.com/santosk20', github: 'https://github.com/santosk20',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/dlemos.jpg', name:'Diana Lemos', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/dianaguimaraes57', twitter: '', github: 'https://github.com/dianalemos',linkedin:'https://www.linkedin.com/profile/view?id=227209565&trk=nav_responsive_tab_profile'},
            {pic: '/sei_15_webpage/img/staff/psilva.jpg', name:'Pedro Silva', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/miguelsilvaface', twitter: '', github: 'https://github.com/pedroSilva4',linkedin:'http://pt.linkedin.com/pub/pedro-silva/a2/7ab/769'},
            {pic: '/sei_15_webpage/img/staff/daraujo.jpg', name:'Duarte Araújo', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/Duarte.Araujo1', twitter: 'https://twitter.com/PMDAraujo', github: 'https://github.com/PMDA',linkedin:''},
            {pic: '/sei_15_webpage/img/staff/csilva.jpg', name:'Cátia Silva', position: 'Press', enterprise: 'Minho', facebook:'https://www.facebook.com/catia.sf.silva', twitter: '', github: '',linkedin: 'http://pt.linkedin.com/in/catiasilva7/pt'},
            {pic: '/sei_15_webpage/img/staff/dduarte.jpg', name:'Duarte Duarte', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/duknust', twitter: '', github: 'https://github.com/duknust',linkedin: 'http://pt.linkedin.com/in/duarteduarte'},
            {pic: '/sei_15_webpage/img/staff/hgoncalves.jpg', name:'Hélder Gonçalves', position: 'Membro', enterprise: 'Minho', facebook:'https://www.facebook.com/helderjosegoncalves', twitter: '', github: 'https://github.com/HelderGoncalves92',linkedin: 'https://www.linkedin.com/in/helderjagoncalves'},
    ];/*
*/

    // $scope.staffSlides
    $scope.$watch(function(){
        return $window.innerWidth;
    }, function(value) {
            if ($window.innerWidth < 768) {
            $scope.staffSlides = [[]];
            var  slidePos= 0,slidei = 0; // slidePos the position in the slide, slidei the index of the slide
            for (var staffi = 0; staffi< staffs.length; staffi++) {
                $scope.staffSlides[slidei].push(staffs[staffi]);
                if (slidePos<11){
                    slidePos++;
                } else if(staffi< staffs.length - 1) {
                    slidePos = 0;
                    slidei++;
                    $scope.staffSlides.push([]);
                }
            };
        } else {
            $scope.staffSlides = [[]];
            var  slidePos = 0, slidei = 0; // slidePos the position in the slide, slidei the index of the slide
            for (var staffi = 0; staffi< staffs.length; staffi++) {
                $scope.staffSlides[slidei].push(staffs[staffi]);

                if (slidePos<17){
                    slidePos++;
                } else if(staffi< staffs.length - 1){
                    slidePos = 0;
                    slidei++;
                    $scope.staffSlides.push([]);
                }
            };
        }
        $scope.carouselOrganization = 0;
    });

    $scope.carouselOrganization = 0;
}]);
