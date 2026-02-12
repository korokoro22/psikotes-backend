import { PrismaClient } from "@prisma/client";

const prisma = new PrismaClient();

const cfitSeed = async () => {
    const totalQuestions = 10; // Total soal contoh
    const totalOptions = 5; // Total opsi per soal
    const optionLabels = ['A', 'B', 'C', 'D', 'E'] as const;

    // Loop untuk setiap soal
    for (let questionNumber = 1; questionNumber <= totalQuestions; questionNumber++) {
        // Buat array opsi untuk soal ini
        const options = optionLabels.slice(0, totalOptions).map((label, index) => ({
            label: label,
            imagePath: `/cfitImages/soal-cfit/subtest4/soal/4-soal-${questionNumber}-answers-${index + 1}.webp`
        }));

        // Create question dengan semua opsinya
        await prisma.cfitQuestion.create({
            data: {
                subtest: 4,
                order: questionNumber,
                isPractice: false,
                imagePath: `/cfitImages/soal-cfit/subtest4/soal/4-soal-${questionNumber}-question.webp`,
                options: {
                    create: options
                }
            }
        });

        console.log(`✓ Soal ${questionNumber} berhasil ditambahkan dengan ${totalOptions} opsi`);
    }

    console.log(`\n✓ Selesai! Total ${totalQuestions} soal dengan ${totalQuestions * totalOptions} opsi telah ditambahkan.`);
};

// const cfitSeed = async () => {
//   const totalQuestions = 14;
//   const optionLabels = ['A', 'B', 'C', 'D', 'E'] as const;

//   for (let q = 1; q <= totalQuestions; q++) {
//     const options = optionLabels.map((label, i) => ({
//       label,
//       imagePath: `/cfitImages/soal-cfit/subtest2/soal/2-soal-${q}-answers-${i + 1}.webp`
//     }));

//     await prisma.cfitQuestion.create({
//       data: {
//         subtest: 2,
//         order: q,
//         isPractice: false,
//         imagePath: "",
//         options: {
//           create: options
//         }
//       }
//     });

//     console.log(`✓ Subtest 2 - Soal ${q} ditambahkan`);
//   }
// };


export { cfitSeed };