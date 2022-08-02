
%Name,Região,Litoral,Divisa com outras regiões,"Densidade Populacional < 4,0",Densidade entre 50 e 100,Divisa com + de 3 estados,+5M de habitantes,Alfabetização < 85%,nome composto

:-dynamic estado/10.
estado('Acre',norte,no,no,no,no,no,no,no,no).
estado('Amapá',norte,yes,no,no,no,no,no,no,no).
estado('Amazonas',norte,no,yes,yes,no,yes,no,no,no).
estado('Pará',norte,yes,yes,no,no,yes,yes,no,no).
estado('Rondônia',norte,no,yes,no,no,no,no,no,no).
estado('Roraima',norte,no,no,yes,no,no,no,no,no).
estado('Tocantins',norte,no,yes,no,no,yes,no,no,no).
estado('Alagoas',nordeste,yes,no,no,no,no,no,yes,no).
estado('Bahia',nordeste,yes,yes,no,no,yes,yes,no,no).
estado('Ceará',nordeste,yes,no,no,yes,yes,yes,yes,no).
estado('Maranhão',nordeste,yes,yes,no,no,yes,yes,yes,no).
estado('Paraíba',nordeste,yes,no,no,yes,no,no,yes,no).
estado('Pernambuco',nordeste,yes,no,no,yes,yes,yes,no,no).
estado('Piauí',nordeste,yes,yes,no,no,yes,no,yes,no).
estado('Rio Grande do Norte',nordeste,yes,no,no,yes,no,no,no,yes).
estado('Sergipe',nordeste,yes,no,no,yes,no,no,no,no).
estado('Distrito Federal',centroOeste,no,yes,no,no,no,no,no,yes).
estado('Goiás',centroOeste,no,yes,no,no,yes,yes,no,no).
estado('Mato Grosso',centroOeste,no,yes,yes,no,yes,no,no,yes).
estado('Mato Grosso do sul',centroOeste,no,yes,no,no,yes,no,no,yes).
estado('Espírito Santo',sudeste,yes,yes,no,yes,no,no,no,yes).
estado('Minas Gerais',sudeste,no,yes,no,no,yes,yes,no,yes).
estado('Rio de Janeiro',sudeste,yes,no,no,no,no,yes,no,yes).
estado('São Paulo',sudeste,yes,yes,no,no,yes,yes,no,yes).
estado('Paraná',sul,yes,yes,no,yes,no,yes,no,no).
estado('Rio Grande do Sul',sul,yes,no,no,no,no,yes,no,yes).
estado('Santa Catarina',sul,yes,no,no,yes,no,yes,no,yes).

% dadosEstados(id, [região, habitantes, acessoAoMar, divisacomOutrasR, densidade, numeroDeDivisas, indiceAlfabetização, nome])
dadosEstados(acre, [norte, 795145, false, false, 4.30, 2, 86.9, 'Acre']).
dadosEstados(alagoas, [nordeste, 3327551, true, false, 108.61, 3, 80.6, 'Alagoas']).
dadosEstados(amapa, [norte, 756500, true, false, 4.16, 1, 95, 'Amapa']).
dadosEstados(amazonas, [norte, 3893763, false, true, 2.05, 5, 93.1, 'Amazonas']).
dadosEstados(bahia, [nordeste, 15150143, true, true, 24.46, 7, 87, 'Bahia']).
dadosEstados(ceara, [nordeste, 8867448, true, false, 54.40, 4, 84.8, 'Ceara']).
dadosEstados(distritoFederal, [centroOeste, 2867869, false, true, 400.73, 2, 97.4, 'Distrito Federal']).
dadosEstados(espiritoSanto, [sudeste, 3894899, true, true, 73.97, 3, 93.8, 'Espírito Santo']).
dadosEstados(goias, [centroOeste, 6551322, false, true, 16.52, 6, 93.5, 'Goiás']).
dadosEstados(maranhao, [nordeste, 6861924, true, true, 18.38, 3, 83.3, 'Maranhão']).
dadosEstados(matoGrosso, [centroOeste, 3236578, false, true, 3.10, 6, 93.5, 'Mato Grosso']).
dadosEstados(matoGrossoDosul, [centroOeste, 2630098, false, true, 6.34, 5, 93.7, 'Mato Grosso do sul']).
dadosEstados(minasGerais, [sudeste, 20777672, false, true, 32.79, 6, 93.8, 'Minas Gerais']).
dadosEstados(parana, [sul, 11112062, true, true, 51.48, 3, 95.5, 'Paraná']).
dadosEstados(paraiba, [nordeste, 3950359, true, false, 63.71, 3, 83.7, 'Paraíba']).
dadosEstados(para, [norte, 8101180, true, true, 5.58, 6, 90.7, 'Pará']).
dadosEstados(pernambuco, [nordeste, 9297861, true, false, 85.58, 5, 87.2, 'Pernambuco']).
dadosEstados(piaui, [nordeste, 3198185, true, true, 11.95, 5, 82.8, 'Piauí']).
dadosEstados(rioDeJaneiro, [sudeste, 16497395, true, false, 352.05, 3, 97.3, 'Rio de Janeiro']).
dadosEstados(rioGrandeDonorte, [nordeste, 3419550, true, false, 56.88, 2, 85.3, 'Rio Grande do norte']).
dadosEstados(rioGrandeDosul, [sul, 11228091, true, false, 38.49, 1, 96.8, 'Rio Grande do sul']).
dadosEstados(rondonia, [norte, 1755015, false, true, 6.46, 3, 93.3, 'Rondônia']).
dadosEstados(roraima, [norte, 500826, false, false, 1.74, 2, 93.4, 'Roraima']).
dadosEstados(santaCatarina, [sul, 6734568, true, false, 61.53, 2, 97.2, 'Santa Catarina']).
dadosEstados(sergipe, [nordeste, 2227294, true, false, 89.81, 2, 85.3, 'Sergipe']).
dadosEstados(saoPaulo, [sudeste, 44169350, true, true, 162.93, 4, 97.2, 'São Paulo']).
dadosEstados(tocantins, [norte, 1502759, false, true, 4.70, 6, 89.6, 'Tocantins']).
nome('Tocantins', false).