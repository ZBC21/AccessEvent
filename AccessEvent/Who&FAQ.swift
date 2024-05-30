//
//  Who&FAQ.swift
//  AccessEvent
//
//  Created by Zhangbei Chen on 22/5/24.
//

import SwiftUI

struct QuienesSomosView: View {
    var body: some View {
        ScrollView{
            VStack {
                Text("¿Quienes Somos?")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    // Agregar más información
                    Text("En AccessEvent, nos dedicamos a fomentar la inclusión y la accesibilidad en la planificación y ejecución de eventos. Creemos en la importancia de crear experiencias que sean acogedoras y accesibles para todas las personas, independientemente de sus necesidades específicas. Nuestra misión es facilitar el acceso a eventos inclusivos y garantizar que todos los participantes puedan disfrutar plenamente de cada experiencia.")
                        .font(.body)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                        
                )
                .padding()
                
                // Agregar una imagen
                Image("lights")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Compromiso con la Inclusión")
                        .bold()
                        .font(.title2)
                    // Agregar más información
                    Text("Nos comprometemos a promover la inclusión en todos los aspectos de nuestro trabajo. Desde la selección de eventos hasta la implementación de medidas de accesibilidad, nos esforzamos por crear un entorno donde todas las personas se sientan bienvenidas y valoradas.")
                        .font(.body)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                )
                .padding()
                
                // Agregar una imagen
                Image("WheelChair")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Diversidad de Eventos")
                        .bold()
                        .font(.title2)
                    // Agregar más información
                    Text("Ofrecemos una amplia variedad de eventos en nuestra plataforma, desde actividades culturales y deportivas hasta conferencias y exposiciones. Nos aseguramos de que haya algo para todos, independientemente de sus intereses o necesidades.")
                        .font(.body)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                )
                .padding()
                
                // Agregar una imagen
                Image("assembly")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Pautas Claras de Accesibilidad")
                        .bold()
                        .font(.title2)
                    Text("Proporcionamos pautas claras y detalladas sobre cómo hacer que los eventos sean accesibles para todas las personas. Esto incluye consideraciones sobre la accesibilidad física del lugar, servicios de apoyo necesarios y otras medidas para garantizar una experiencia inclusiva.")
                        .font(.body)
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                )
                .padding()
                
                // Agregar una imagen
                Image("notebook")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
            }
        }
    }
}

struct FAQView: View {
    var body: some View {
        ScrollView{
            
            Text("Preguntas Frecuentes")
                .bold()
                .font(.largeTitle)
            VStack(alignment: .leading, spacing: 10) {
                Text("¿Qué es AccessEvent?")
                    .bold()
                Text("Puedes registrarte en AccessEvent creando una cuenta gratuita en nuestra página de inicio. Simplemente sigue las instrucciones de registro y completa la información requerida.")
                    .font(.body)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
            )
            .padding()
            VStack(alignment: .leading, spacing: 10) {
                Text("¿Cómo puedo registrarme en AccessEvent?")
                    .bold()
                Text("Proporcionamos pautas claras y detalladas sobre cómo hacer que los eventos sean accesibles para todas las personas. Esto incluye consideraciones sobre la accesibilidad física del lugar, servicios de apoyo necesarios y otras medidas para garantizar una experiencia inclusiva.")
                    .font(.body)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
            )
            .padding()
            VStack(alignment: .leading, spacing: 10) {
                Text("¿Cuáles son las características principales de AccessEvent?")
                    .bold()
                Text("AccessEvent ofrece funciones como la planificación de eventos inclusivos, la publicación de eventos en nuestro calendario interactivo, y la guía sobre pautas de accesibilidad para asegurar que los eventos sean aptos para personas con discapacidades.")
                    .font(.body)
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.gray, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
            )
            .padding()
            
             VStack(alignment: .leading, spacing: 10) {
             Text("¿Qué tipo de eventos puedo encontrar en AccessEvent?")
             .bold()
             Text("En AccessEvent, puedes encontrar una amplia variedad de eventos, incluyendo actividades culturales, deportivas, educativas, y más. Nuestro objetivo es ofrecer eventos para todos los intereses y necesidades.")
             .font(.body)
             }
             .padding()
             .background(
             RoundedRectangle(cornerRadius: 15)
             .stroke(Color.gray, lineWidth: 2)
             .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
             )
             .padding()
             VStack(alignment: .leading, spacing: 10) {
             Text("¿Cómo puedo asegurarme de que un evento en AccessEvent sea accesible para mí?")
             .bold()
             Text("Todos los eventos en AccessEvent están etiquetados con información sobre su accesibilidad, incluyendo detalles sobre la accesibilidad física del lugar, servicios de apoyo disponibles, y otras consideraciones importantes.")
             .font(.body)
             }
             .padding()
             .background(
             RoundedRectangle(cornerRadius: 15)
             .stroke(Color.gray, lineWidth: 2)
             .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
             )
             .padding()
             VStack(alignment: .leading, spacing: 10) {
             Text("¿Cómo puedo contactar al equipo de soporte de AccessEvent?")
             .bold()
             Text("Puedes ponerte en contacto con nuestro equipo de soporte enviando un correo electrónico a support@accessevent.com. Estamos aquí para ayudarte con cualquier pregunta o problema que puedas tener.")
             .font(.body)
             }
             .padding()
             .background(
             RoundedRectangle(cornerRadius: 15)
             .stroke(Color.gray, lineWidth: 2)
             .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
             )
             .padding()
             VStack(alignment: .leading, spacing: 10) {
             Text("¿Es seguro usar AccessEvent para publicar eventos?")
             .bold()
             Text("Sí, la seguridad de nuestros usuarios es una prioridad para nosotros. Utilizamos medidas de seguridad avanzadas para proteger la información de nuestros usuarios y garantizar una experiencia segura en nuestra plataforma.")
             .font(.body)
             }
             .padding()
             .background(
             RoundedRectangle(cornerRadius: 15)
             .stroke(Color.gray, lineWidth: 2)
             .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
             )
             .padding()
             
        }
    }
}
#Preview{
    FAQView()
}
