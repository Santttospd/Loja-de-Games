    <!DOCTYPE html>
    <html lang="pt-br">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Carrossel de Imagens</title>
        <style>
            /* Estilo básico para o corpo da página */
             * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
            }

            body {
                background: #091F4C;
                color: #fff;
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                min-height: 100vh; /* Alterado de height para min-height */
                font-family: 'Work Sans', sans-serif;
            }
            /****************MENU***************/
                    .menu {
                        position:absolute;
                        width: 100%;
                        background-color: #07183B;
                        position: fixed;
                        top: 0;
                        left: 50%;
                        transform: translateX(-50%);
                        display: flex;
                        justify-content: space-between;
                        align-items: center;
                        text-align: center;
                        z-index: 1;
                    }

                    .logo {
                        width: 250px;
                        height: auto;
                        cursor: pointer;
                        transition: 0.3s;
                        transition: transform 0.3s ease;
                    }

                    .menu a {
                        color: #fff;
                        text-decoration: none;
                        font-size: 25px;
                        transition: 0.3s;
                    }

                    .links {
                        position: relative; /* Para posicionar o submenu */
                        display: flex; /* Adiciona flexbox para alinhar os itens em linha */
                        gap: 0px; /* Adiciona um espaço de 30px entre os itens */
                    }

                    .links a {
                        color: #fff;
                        text-decoration: none;
                        font-size: 25px;
                        transition: background 0.3s ease, transform 0.3s ease; /* Transição suave para fundo e transformação */
                        padding: 10px 20px;
                        border-radius: 5px;
                    }

                    .links a:hover {
                        background: #091F4C;
                        transform: translateY(-5px) scale(1.05); /* Move o link para cima e aumenta um pouco o tamanho */
                    }


                    /******************SUBMENU**********************/
                    .submenu {
                        display: none; /* Esconde o submenu por padrão */
                        position: absolute;
                        background-color: #07183B;
                        padding: 10px 0;
                        border-radius: 5px;
                        z-index: 1; /* Para garantir que o submenu fique acima de outros elementos */
                    }


                    .submenu-item {
                        padding: 10px 20px;
                        color: #fff;
                        text-decoration: none;
                        display: block; /* Para que o link ocupe toda a largura */
                    }
                    .menu-item:hover .submenu {
                           display: block;
                    }


                    .submenu-item:hover {
                        background-color: #091F4C;
                    }

                    .btnEntrar a {
                        padding-right: 50px;
                    }

                    .btn-img {
                        width: 120px;
                        height: auto;
                        cursor: pointer;
                        transition: 0.3s;
                        transition: transform 0.3s ease;
                    }

                    .btn-img:hover {
                        transform: translateY(-3px); /* Move o link para cima */
                    }

                    .btn-logo {
                        width:  220px;
                        height: auto;
                        cursor: pointer;
                        transition: 0.3s;
                        transition: transform 0.3s ease;
                    }

                    .btn-logo:hover {
                        transform: translateY(-3px); /* Move o link para cima */
                    }



            /* Estilo do carrossel */
            /* Estilo do carrossel */
            .carousel {
                position: relative;
                max-width: auto;
                height: 630px;
                overflow: hidden;
                margin-top: 100px; /* Ajuste conforme necessário */
                margin-bottom: 30px;
            }

            /* Estilo para cada imagem */
            .carousel-image {
                width: 100%; /* Cada imagem ocupa 100% da largura do carrossel */
                height: 100%; /* A altura agora é 100% do contêiner do carrossel */
                object-fit: cover; /* Cobre o espaço sem distorcer */
            }

            /* Estilo para as imagens do carrossel */
            .carousel-images {
                display: flex; /* Alinha as imagens em linha */
                transition: transform 0.5s ease; /* Transição suave ao mudar de imagem */
            }



            /* Estilo dos botões de navegação */
            .carousel-button {
                position: absolute; /* Posiciona os botões sobre o carrossel */
                top: 50%; /* Centraliza verticalmente */
                transform: translateY(-50%); /* Ajusta a posição para centralizar */
                background-color: rgba(0, 0, 0, 0.5); /* Fundo semi-transparente */
                color: white; /* Cor do texto */
                border: none; /* Remove borda */
                padding: 10px; /* Espaçamento interno */
                cursor: pointer; /* Muda o cursor para indicar que é clicável */
            }

            /* Posiciona o botão "anterior" à esquerda */
            .prev {
                left: 10px; /* Distância da borda esquerda */
            }

            /* Posiciona o botão "próximo" à direita */
            .next {
                right: 10px; /* Distância da borda direita */
            }

            /* Estilo dos indicadores */
            .carousel-indicators {
                position: absolute; /* Posiciona os indicadores sobre o carrossel */
                bottom: 10px; /* Distância da parte inferior */
                left: 50%; /* Centraliza horizontalmente */
                transform: translateX(-50%); /* Ajusta a posição para centralizar */
                display: flex; /* Alinha os indicadores em linha */
            }

            /* Estilo para cada indicador */
            .indicator {
                width: 10px; /* Largura do indicador */
                height: 10px; /* Altura do indicador */
                background-color: white; /* Cor do indicador */
                border-radius: 50%; /* Forma circular */
                margin: 0 5px; /* Espaçamento entre os indicadores */
                cursor: pointer; /* Muda o cursor para indicar que é clicável */
            }

            /* Estilo para o indicador ativo */
            .active {
                background-color: #f39c12; /* Cor do indicador ativo */
            }
           .rodape {
                position: relative;
                bottom: 0;
                width: 100%;
                background-color: #07183B;
                color: #fff;
                text-align: center;
                font-size: 14px;
                padding: 10px;
                z-index: 10;
            }


            .todosProdutos {
                display: flex;
                flex-wrap: wrap; /* Permite que os produtos quebrem para a próxima linha em telas menores */
                justify-content: space-around; /* Distribui os produtos uniformemente */
                gap: 20px; /* Espaçamento entre os produtos */
                padding: 20px; /* Espaçamento interno */
            }

            .produtos {
                background-color: white;
                width: 300px;
                border-radius: 3px; /* Cantos arredondados */
                overflow: hidden; /* Garante que a imagem não ultrapasse o contêiner */
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Sombra suave */
                transition: transform 0.3s ease, box-shadow 0.3s ease; /* Efeito de transição */
                display: flex;
                flex-direction: column; /* Alinha a imagem e o texto verticalmente */
            }

            .produtos:hover {
                transform: translateY(-5px); /* Efeito de levantar ao passar o mouse */
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.5); /* Sombra mais intensa ao passar o mouse */
            }

            .imagem-produto {
                width: 100%;
                height: 330px; /* Altura fixa para a imagem */
                overflow: hidden; /* Garante que a imagem não ultrapasse o contêiner */
            }

            .imagem-produto img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* Garante que a imagem cubra o contêiner sem distorcer */
            }

            .especificacoes {
                text-align: center; /* Centraliza o texto */
                flex-grow: 1; /* Faz com que o texto ocupe o espaço restante */
                background-color: transparent;
            }

            .especificacoes h3 {
                font-size: 18px;
                color: #333;
                margin-top: 5px;
            }

            .especificacoes p {
                font-size: 14px;
                color: #666;
                margin-bottom: 5px;
            }

            .todosProdutos img {
                width: 100%;
                height: 100%;
                object-fit: cover; /* Garante que a imagem cubra o contêiner sem distorcer */
            }


    </style>

    </head>
        <body>
            <div class="menu">
                        <div class="logo">
                            <a href="index.jsp">
                                <img src="imagens/Logo.png" class="btn-logo">
                            </a>
                        </div>

                        <div class="links">
                            <div class="menu-item">
                                <a href="index.jsp">Destaques &#x25BC</a>
                                <div class="submenu">
                                    <a href="destaque1.jsp" class="submenu-item">Ver todos os produtos</a>
                                    <a href="destaque2.jsp" class="submenu-item">Todas as promoções</a>
                                    <a href="pc2.jsp" class="submenu-item">Lançamento</a>
                                </div>
                            </div>

                            <div class="menu-item">
                                <a href="sobre.jsp">PC &#x25BC</a>
                                <div class="submenu">
                                    <a href="pc1.jsp" class="submenu-item">Todos os produtos PC</a>
                                    <a href="pc1.jsp" class="submenu-item">Lançamentos</a>
                                    <a href="pc2.jsp" class="submenu-item">Mais Populares</a>

                                </div>
                            </div>

                            <div class="menu-item">
                                <a href="contato.jsp">Console &#x25BC</a>
                                <div class="submenu">
                                    <a href="console1.jsp" class="submenu-item">Playstation</a>
                                    <a href="console2.jsp" class="submenu-item">Xbox</a>
                                    <a href="console2.jsp" class="submenu-item">Nitendo</a>
                                </div>
                            </div>

                            <div class="menu-item">
                                <a href="cadastro.jsp">Mobile &#x25BC</a>
                                <div class="submenu">
                                    <a href="mobile1.jsp" class="submenu-item">Jogos grátis</a>
                                    <a href="mobile2.jsp" class="submenu-item">Todas as promoções</a>
                                    <a href="mobile2.jsp" class="submenu-item">Gift Cards</a>
                                </div>
                            </div>
                        </div>

                        <div class="btnEntrar">
                            <a href="index.jsp">
                                <img src="imagens/Entrar.png" class="btn-img">
                            </a>
                        </div>
                    </div>
            <div class="menu">
                <div class="logo">
                    <a href="index.jsp">
                        <img src="imagens/Logo.png" class="btn-logo">
                    </a>
            </div>

                <div class="links">
                    <div class="menu-item">
                        <a href="index.jsp">Destaques &#x25BC</a>
                        <div class="submenu">
                            <a href="destaque1.jsp" class="submenu-item">Ver todos os produtos</a>
                            <a href="destaque2.jsp" class="submenu-item">Todas as promoções</a>
                            <a href="pc2.jsp" class="submenu-item">Lançamento</a>
                        </div>
                    </div>

                    <div class="menu-item">
                        <a href="sobre.jsp">PC &#x25BC</a>
                        <div class="submenu">
                            <a href="pc1.jsp" class="submenu-item">Todos os produtos PC</a>
                            <a href="pc1.jsp" class="submenu-item">Lançamentos</a>
                            <a href="pc2.jsp" class="submenu-item">Mais Populares</a>

                        </div>
                    </div>

                    <div class="menu-item">
                        <a href="contato.jsp">Console &#x25BC</a>
                        <div class="submenu">
                            <a href="console1.jsp" class="submenu-item">Playstation</a>
                            <a href="console2.jsp" class="submenu-item">Xbox</a>
                            <a href="console2.jsp" class="submenu-item">Nintendo</a>
                        </div>
                    </div>

                    <div class="menu-item">
                        <a href="cadastro.jsp">Mobile &#x25BC</a>
                        <div class="submenu">
                            <a href="mobile1.jsp" class="submenu-item">Jogos grátis</a>
                            <a href="mobile2.jsp" class="submenu-item">Todas as promoções</a>
                            <a href="mobile2.jsp" class="submenu-item">Gift Cards</a>
                        </div>
                    </div>
                </div>

                <div class="btnEntrar">
                    <a href="index.jsp">
                        <img src="imagens/Entrar.png" class="btn-img">
                    </a>
                </div>
            </div>

            <div class="carousel">
                <div class="carousel-images">
                    <img src="imagens/gta6.jpg" class="carousel-image">
                    <img src="imagens/diablo.jpg" class="carousel-image">
                    <img src="imagens/jogo1.jpg" class="carousel-image">
                </div>
                <button class="carousel-button prev" onclick="prevImage()">&#10094;</button> <!-- Botão anterior -->
                <button class="carousel-button next" onclick="nextImage()">&#10095;</button> <!-- Botão próximo -->
                <div class="carousel-indicators">
                    <div class="indicator active" data-index="0" onclick="showImage(0)"></div> <!-- Indicador para a primeira imagem -->
                    <div class="indicator" data-index="1" onclick="showImage(1)"></div> <!-- Indicador para a segunda imagem -->
                    <div class="indicator" data-index="2" onclick="showImage(2)"></div> <!-- Indicador para a terceira imagem -->
                </div>
            </div>


        <div class="todosProdutos">

            <a href="">
                <div class="produtos">
                    <div class="imagem-produto">
                        <img src="imagens/gta6.jpg" alt="GTA 6">
                    </div>
                    <div class="especificacoes">
                        <h3>GTA 6</h3>
                        <p>Lançamento: 2025</p>
                        <p>Plataforma: PS5, Xbox Series X.</p>
                    </div>
                </div>
            </a>

            <a href="">
                <div class="produtos">
                    <div class="imagem-produto">
                        <img src="imagens/diablo.jpg" alt="Diablo">
                    </div>
                    <div class="especificacoes">
                        <h3>Diablo IV</h3>
                        <p>Lançamento: 2023</p>
                        <p>Plataforma: PC, PS4, PS5, Xbox.</p>
                    </div>
                </div>
            </a>

            <a href="">
                <div class="produtos">
                    <div class="imagem-produto">
                        <img src="imagens/rdr.jpg" alt="Diablo">
                    </div>
                    <div class="especificacoes">
                        <h3>Red Dead Redemption 2</h3>
                        <p>Lançamento: 2024</p>
                        <p>Plataforma: PC, Xbox Series X.</p>
                    </div>
                </div>
            </a>
            <a href="">
                <div class="produtos">
                    <div class="imagem-produto">
                        <img src="imagens/minecraft.png" alt="Diablo">
                    </div>
                    <div class="especificacoes">
                        <h3>Minecraft</h3>
                        <p>Lançamento: 2009</p>
                        <p>Plataforma: PC, PS4</p>
                    </div>
                </div>
            </a>




        </div>




            <div class="rodape">
                <p>&copy; 2025 E-commerce de Jogos. Todos os direitos reservados.</p>
                <a href="#">Termos de Uso</a> | <a href="#">Política de Privacidade</a>
            </div>



        <script>
            let currentIndex = 0; // Índice da imagem atual
            const images = document.querySelector('.carousel-images'); // Seleciona o contêiner das imagens
            const indicators = document.querySelectorAll('.indicator'); // Seleciona todos os indicadores

            // Função para mostrar a imagem com o índice especificado
            function showImage(index) {
                currentIndex = index; // Atualiza o índice atual
                images.style.transform = `translateX(-${currentIndex * 100}%)`; // Move as imagens para a esquerda
                updateIndicators(); // Atualiza os indicadores
            }

            // Função para ir para a próxima imagem
            function nextImage() {
                currentIndex = (currentIndex + 1) % indicators.length; // Incrementa o índice e garante que volte ao início
                showImage(currentIndex); // Mostra a nova imagem
            }

            // Função para ir para a imagem anterior
            function prevImage() {
                currentIndex = (currentIndex - 1 + indicators.length) % indicators.length; // Decrementa o índice e garante que não fique negativo
                showImage(currentIndex); // Mostra a nova imagem
            }

            // Função para atualizar os indicadores
            function updateIndicators() {
                indicators.forEach((indicator, index) => {
                    indicator.classList.toggle('active', index === currentIndex); // Adiciona a classe 'active' ao indicador correspondente
                });
            }

            // Muda a imagem a cada 5 segundos
            setInterval(nextImage, 5000);
             // Adicionando eventos para mostrar e esconder os submenus
            document.querySelectorAll('.menu-item').forEach(item => {
                item.addEventListener('mouseenter', () => {
                    const submenu = item.querySelector('.submenu');
                    if (submenu) {
                        submenu.style.display = 'block'; // Mostra o submenu
                    }
                });

                item.addEventListener('mouseleave', () => {
                    const submenu = item.querySelector('.submenu');
                    if (submenu) {
                        submenu.style.display = 'none'; // Esconde o submenu
                    }
                });
            });
        </script>
    </body>
    </html>