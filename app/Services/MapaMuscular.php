<?php

declare(strict_types=1);

namespace App\Services;

/**
 * Traduz a identificação dos músculos do catálogo em regiões para a visualização da análise de
 * treino.
 *
 * Desenho esquemático original MOVI+. Coordenadas de metade do corpo (espelhadas na view).
 * Músculos profundos aparecem em faixas esquemáticas; não é um atlas anatômico.
 * svg_id é respeitado quando reconhecido; codigo é o fallback estável, sem escrita no catálogo.
 */
final class MapaMuscular
{
    /**
     * Monta o mapa por código muscular com grupo, vista e contorno curvo para o SVG.
     *
     * @return array<string,array{grupo:string,vista:string,contorno:string}>
     */
    public static function regioes(): array
    {
        $r = [];
        // Cada contorno representa um lado do corpo e é espelhado na vista correspondente.
        $add = static function (string $grupo, string $vista, array $itens) use (&$r): void {
            foreach ($itens as $codigo => $contorno) {
                $r[$codigo] = ['grupo' => $grupo, 'vista' => $vista, 'contorno' => $contorno];
            }
        };
        $add('Peitoral', 'frente', [
            'peitoral_maior' => 'M3 83 Q18 76 30 77 Q37 78 44 86 C39 92 41 100 33 104 Q19 111 4 106 Q1 99 3 83Z',
            'peitoral_menor' => 'M4 110 Q20 113 36 107 Q31 118 20 119 Q9 120 4 116Z']);
        $add('Ombros', 'frente', [
            'deltoide' => 'M34 73 Q45 66 54 77 Q47 76 43 82Z',
            'deltoide_anterior' => 'M45 81 Q61 76 61 105 C54 99 49 103 44 96 Q43 88 45 81Z',
            'deltoide_lateral' => 'M56 79 C65 82 69 103 66 119 Q60 114 61 103 Q62 90 56 79Z']);
        $add('Ombros', 'costas', [
            'deltoide_posterior' => 'M42 79 Q61 73 65 106 Q55 100 45 102 Q48 90 42 79Z',
            'infraespinal' => 'M20 93 Q31 95 42 89 Q42 104 24 111 Q20 108 20 93Z',
            'supraespinal' => 'M20 84 Q33 81 41 81 L41 87 Q31 92 21 90Z']);
        $add('Bíceps', 'frente', [
            'biceps_braquial' => 'M47 102 Q57 103 61 117 C66 126 67 141 61 149 Q53 145 49 130 Q45 115 47 102Z',
            'braquial' => 'M62 117 Q72 125 73 146 Q73 151 66 153 Q70 138 62 117Z']);
        $add('Tríceps', 'costas', ['triceps_braquial' => 'M47 103 Q55 104 63 111 Q69 123 72 144 Q69 150 60 151 C51 142 47 121 47 103Z']);
        $add('Antebraços', 'frente', [
            'braquiorradial' => 'M58 154 Q62 150 67 154 C73 162 75 177 74 193 Q66 181 58 154Z',
            'flexor_radial_carpo' => 'M69 154 Q74 151 78 169 L84 195 L79 200 Q77 179 69 154Z',
            'flexor_ulnar_carpo' => 'M58 158 C64 174 69 183 73 198 Q63 188 58 170Z']);
        $add('Antebraços', 'costas', [
            'extensor_dedos' => 'M69.5 177.5 Q63 155 65.5 154 Q68 153 73.5 173.5 Q79 194 77.5 197 Q76 200 69.5 177.5Z',
            'extensor_radial_curto_carpo' => 'M75 177 Q69 155 71 157 Q73 159 79 177.5 Q85 196 83 197.5 Q81 199 75 177Z',
            'extensor_radial_longo_carpo' => 'M63.5 173.5 Q58 155 59.5 154 Q61 153 66.5 173.5 Q72 194 70.5 193 Q69 192 63.5 173.5Z',
            'extensor_ulnar_carpo' => 'M62 176.5 Q56 158 57 164.5 Q58 171 62 182 Q66 193 67 194 Q68 195 62 176.5Z']);
        $add('Costas', 'costas', [
            'latissimo_dorso' => 'M23 114 Q35 111 44 103 C41 122 38 143 30 153 Q23 164 18 171 Q15 147 22 131Z',
            'trapezio' => 'M2 64 Q9 69 16 78 Q9 81 2 79Z',
            'trapezio_superior' => 'M12 61 Q19 70 40 76 Q30 77 20 82 Q16 73 12 61Z',
            'trapezio_medio' => 'M2 82 Q12 84 18 81 Q21 94 19 108 Q10 111 2 104Z',
            'trapezio_inferior' => 'M2 108 Q12 113 20 110 Q16 125 3 140Z',
            'eretores_espinha' => 'M3 142 Q8 136 13 132 Q10 153 14 181 Q9 188 3 187Z',
            'multifidos' => 'M15 166.5 Q15 150 16.5 154.5 Q18 159 18.5 171.5 Q19 184 17 183.5 Q15 183 15 166.5Z',
            'quadrado_lombar' => 'M23 175.5 Q23 166 28 161 Q33 156 33.5 168.5 Q34 181 28.5 183 Q23 185 23 175.5Z']);
        $add('Abdômen', 'frente', [
            'reto_abdominal' => 'M3 122 Q9 120 17 123 Q19 129 17 134 Q8 136 3 133Z M3 136 Q11 138 17 136 L17 146 Q10 149 3 146Z M3 149 Q11 151 17 148 Q17 156 15 161 Q10 164 3 161Z M3 164 Q10 166 15 163 Q14 179 4 186Z',
            'obliquo_externo' => 'M23 136 Q30 132 37 125 Q36 150 25 166 Q20 156 23 136Z',
            'obliquo_interno' => 'M21.5 176.5 Q21 170 27 164 Q33 158 34 166 Q35 174 28.5 178.5 Q22 183 21.5 176.5Z',
            'transverso_abdomen' => 'M4 191 Q4 187 18 183 Q32 179 32.5 183.5 Q33 188 18.5 191.5 Q4 195 4 191Z',
            'serratil_anterior' => 'M21 121 Q28 117 38 115 L34 121 L38 119 L33 125 L35 124 L22 134Z']);
        $add('Pescoço', 'frente', ['esternocleidomastoideo' => 'M5 56 Q10 57 13 51 Q14 65 23 73 Q12 71 5 56Z']);
        $add('Quadríceps', 'frente', [
            'reto_femoral' => 'M24 209 Q29 203 36 207 C38 226 33 255 23 275 C19 260 19 231 24 209Z',
            'vasto_lateral' => 'M38 208 C47 222 47 248 41 266 Q39 278 33 287 C30 267 39 239 38 208Z',
            'vasto_medial' => 'M18 244 Q21 265 29 278 Q31 286 24 291 C15 289 14 272 18 244Z',
            'vasto_intermedio' => 'M25.5 285.5 Q24 276 28 276 Q32 276 31.5 283.5 Q31 291 29 293 Q27 295 25.5 285.5Z']);
        $add('Adutores', 'frente', [
            'adutor_curto' => 'M6 217 Q4 210 9 209 Q14 208 14 214 Q14 220 11 222 Q8 224 6 217Z',
            'adutor_longo' => 'M11 242.5 Q8 227 12 224.5 Q16 222 17.5 230.5 Q19 239 16.5 248.5 Q14 258 11 242.5Z',
            'adutor_magno' => 'M8 253 Q4 228 5.5 228 Q7 228 10 246 Q13 264 12.5 271 Q12 278 8 253Z',
            'gracil' => 'M4.5 255.5 Q2 231 3 234.5 Q4 238 7 259 Q10 280 8.5 280 Q7 280 4.5 255.5Z',
            'pectineo' => 'M4 203 Q4 199 10.5 198.5 Q17 198 17.5 201.5 Q18 205 11 206 Q4 207 4 203Z']);
        $add('Quadril', 'frente', [
            'iliopsoas' => 'M20.5 199.5 Q21 191 26 191.5 Q31 192 29 198 Q27 204 23.5 206 Q20 208 20.5 199.5Z',
            'tensor_fascia_lata' => 'M36.5 198.5 Q36 188 38.5 193.5 Q41 199 41.5 206.5 Q42 214 39.5 211.5 Q37 209 36.5 198.5Z']);
        $add('Glúteos', 'costas', [
            'gluteo_maximo' => 'M3 202 Q14 193 29 194 Q38 197 42 208 Q42 218 32 225 Q17 232 4 224 Q1 215 3 202Z',
            'gluteo_medio' => 'M23 187 Q31 181 36 184 Q42 188 43 201 Q36 194 28 192Z',
            'gluteo_minimo' => 'M5 193 Q5 190 13 188.5 Q21 187 21.5 190.5 Q22 194 13.5 195 Q5 196 5 193Z']);
        $add('Posteriores da coxa', 'costas', [
            'biceps_femoral' => 'M28 232 Q36 228 41 225 Q45 250 33 285 L30 293 Q25 278 27 258Z',
            'semimembranoso' => 'M3 229 Q11 232 16 232 Q20 247 20 268 Q19 279 13 290 C8 272 4 249 3 229Z',
            'semitendinoso' => 'M18 232 Q22 234 26 232 C24 253 28 273 22 291 Q18 284 20 273Z']);
        $add('Panturrilhas', 'costas', [
            'gastrocnemio' => 'M14 302 Q22 297 24 308 Q26 298 32 300 C36 306 39 320 34 334 Q31 343 28 349 Q22 340 22 335 Q19 345 15 340 C10 330 10 312 14 302Z',
            'soleo' => 'M14 343 Q21 347 23 341 Q25 348 30 351 C27 362 26 374 21 380 Q18 370 17 359Z']);
        $add('Pernas', 'frente', ['tibial_anterior' => 'M15 302 Q21 298 27 304 Q32 319 30 335 C27 350 26 369 23 379 Q18 360 18 346 Q13 318 15 302Z']);
        return $r;
    }

    /**
     * Procura primeiro a região indicada por svg_id e depois o código do músculo. Devolve null quando o
     * desenho não possui região compatível.
     *
     * @param array $musculo Registro do catálogo com código e identificação visual.
     * @return ?string
     */
    public static function chave(array $musculo): ?string
    {
        $r = self::regioes();
        // Um identificador visual vazio ou desconhecido deixa o código estável do catálogo participar da busca.
        foreach ([$musculo['svg_id'] ?? '', $musculo['codigo'] ?? ''] as $chave) {
            if (isset($r[$chave])) {
                return $chave;
            }
        }
        return null;
    }
}
