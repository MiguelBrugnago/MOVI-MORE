<?php
declare(strict_types=1);
namespace App\Services;

/** Desenho esquemático original MOVI+. Coordenadas de metade do corpo (espelhadas na view).
 * Músculos profundos aparecem em faixas esquemáticas; não é um atlas anatômico.
 * svg_id é respeitado quando reconhecido; codigo é o fallback estável, sem escrita no catálogo.
 */
final class MapaMuscular
{
    public static function regioes(): array
    {
        $r=[];
        $add=static function(string $grupo,string $vista,array $itens) use (&$r): void {
            foreach ($itens as $codigo=>$pontos) $r[$codigo]=['grupo'=>$grupo,'vista'=>$vista,'pontos'=>$pontos];
        };
        $add('Peitoral','frente',[
            'peitoral_maior'=>'3,81 29,75 43,87 39,107 4,106',
            'peitoral_menor'=>'4,110 36,111 30,118 4,117']);
        $add('Ombros','frente',[
            'deltoide'=>'37,70 46,70 51,76 43,79',
            'deltoide_anterior'=>'46,80 56,85 59,104 46,100',
            'deltoide_lateral'=>'59,85 65,97 65,119 60,115']);
        $add('Ombros','costas',[
            'deltoide_posterior'=>'43,78 58,85 64,107 46,102',
            'infraespinal'=>'20,94 40,92 38,107 23,110',
            'supraespinal'=>'22,83 38,82 40,89 22,90']);
        $add('Bíceps','frente',[
            'biceps_braquial'=>'47,105 59,111 67,143 56,150 47,124',
            'braquial'=>'60,119 65,122 73,148 68,153']);
        $add('Tríceps','costas',['triceps_braquial'=>'47,107 62,111 72,146 57,150 48,129']);
        $add('Antebraços','frente',[
            'braquiorradial'=>'59,156 66,153 75,181 72,193',
            'flexor_radial_carpo'=>'68,154 72,157 83,194 77,199',
            'flexor_ulnar_carpo'=>'58,160 62,178 71,199 73,193']);
        $add('Antebraços','costas',[
            'extensor_dedos'=>'63,155 68,153 79,194 76,200',
            'extensor_radial_curto_carpo'=>'69,155 73,159 85,196 81,199',
            'extensor_radial_longo_carpo'=>'58,155 61,153 72,194 69,192',
            'extensor_ulnar_carpo'=>'56,158 58,171 66,193 68,195']);
        $add('Costas','costas',[
            'latissimo_dorso'=>'24,114 40,111 35,151 20,169 17,145',
            'trapezio'=>'2,68 12,70 17,78 3,79',
            'trapezio_superior'=>'13,66 21,73 39,77 21,81',
            'trapezio_medio'=>'3,83 18,83 18,108 3,106',
            'trapezio_inferior'=>'3,110 19,112 12,130 3,138',
            'eretores_espinha'=>'3,143 10,137 13,181 3,186',
            'multifidos'=>'15,150 18,159 19,184 15,183',
            'quadrado_lombar'=>'23,166 33,156 34,181 23,185']);
        $add('Abdômen','frente',[
            'reto_abdominal'=>'3,122 16,122 17,170 4,184',
            'obliquo_externo'=>'24,136 35,126 32,154 25,166',
            'obliquo_interno'=>'21,170 33,158 35,174 22,183',
            'transverso_abdomen'=>'4,187 32,179 33,188 4,195',
            'serratil_anterior'=>'23,121 36,119 35,125 23,132']);
        $add('Pescoço','frente',['esternocleidomastoideo'=>'4,58 12,56 22,72 13,75']);
        $add('Quadríceps','frente',[
            'reto_femoral'=>'24,210 36,207 33,260 23,272',
            'vasto_lateral'=>'38,209 44,224 42,265 34,283 33,267',
            'vasto_medial'=>'19,244 21,273 30,280 25,290 17,280',
            'vasto_intermedio'=>'24,276 32,276 31,291 27,295']);
        $add('Adutores','frente',[
            'adutor_curto'=>'4,210 14,208 14,220 8,224',
            'adutor_longo'=>'8,227 16,222 19,239 14,258',
            'adutor_magno'=>'4,228 7,228 13,264 12,278',
            'gracil'=>'2,231 4,238 10,280 7,280',
            'pectineo'=>'4,199 17,198 18,205 4,207']);
        $add('Quadril','frente',[
            'iliopsoas'=>'21,191 31,192 27,204 20,208',
            'tensor_fascia_lata'=>'36,188 41,199 42,214 37,209']);
        $add('Glúteos','costas',[
            'gluteo_maximo'=>'3,199 30,195 41,207 36,224 4,225',
            'gluteo_medio'=>'25,187 35,184 42,194 36,202',
            'gluteo_minimo'=>'5,190 21,187 22,194 5,196']);
        $add('Posteriores da coxa','costas',[
            'biceps_femoral'=>'29,230 39,228 39,262 32,289 27,281',
            'semimembranoso'=>'4,232 15,231 20,274 13,289 8,266',
            'semitendinoso'=>'18,231 25,231 25,280 22,289 19,279']);
        $add('Panturrilhas','costas',[
            'gastrocnemio'=>'15,300 31,300 36,324 29,348 16,340 12,318',
            'soleo'=>'15,344 28,351 26,374 19,378']);
        $add('Pernas','frente',['tibial_anterior'=>'17,302 26,302 30,331 24,378 18,374']);
        return $r;
    }

    public static function chave(array $musculo): ?string
    {
        $r=self::regioes();
        foreach ([$musculo['svg_id']??'', $musculo['codigo']??''] as $chave) if (isset($r[$chave])) return $chave;
        return null;
    }
}
