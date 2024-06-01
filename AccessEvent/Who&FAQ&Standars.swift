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
                    .foregroundColor(Color.init(hex: "43306C"))
                
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
            VStack {
                
                Text("Preguntas Frecuentes")
                    .bold()
                    .font(.largeTitle)
                    .foregroundColor(Color.init(hex: "43306C"))
                VStack(alignment: .leading, spacing: 10) {
                    Text("¿Qué es AccessEvent?")
                        .font(.title3)
                        .bold()
                    Text("AccessEvent es una plataforma dedicada a fomentar la inclusión y accesibilidad en eventos.")
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
                    Text("¿Cómo puedo registrarme en              AccessEvent?")
                        .bold()
                        .font(.title3)
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
                    Text("¿Cuáles son las características principales de AccessEvent?")
                        .bold()
                        .font(.title3)
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
                        .font(.title3)
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
                        .font(.title3)
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
                    Text("¿Cómo puedo contactar al equipo                de soporte de AccessEvent?")
                        .bold()
                        .font(.title3)

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
                    Text("¿Es seguro usar AccessEvent para          publicar eventos?")
                        .bold()
                        .font(.title3)
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
}


struct AccessibilityStandardsView: View {
    var body: some View {
        ScrollView{
            VStack {
                Text("Estándar de Accesibilidad para Eventos")
                    .bold()
                    .font(.title)
                    .foregroundColor(Color.init(hex: "43306C"))
                    .multilineTextAlignment(.center)
                VStack(alignment: .leading, spacing: 10) {
                    Text("Introducción")
                        .bold()
                    Text("Este estándar tiene como objetivo guiar a organizadores de eventos en la implementación de medidas de accesibilidad para personas con diversas discapacidades. Incluye normas generales y subnormas específicas para asegurar que los eventos sean inclusivos y accesibles para todos")
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
                    Text("Tier List de Accesibilidad")
                        .bold()
                    Text("Tier 1: Básico")
                        .font(.body)
                        .bold()
                    Text("Cumple con las acciones básicas en todas las categorías generales y subcategorías específicas")
                        .font(.body)
                    Text("Tier 2: Moderado")
                        .font(.body)
                        .bold()
                    Text("Implementa mejoras moderadas además de las acciones básicas.")
                        .font(.body)
                    Text("Tier 3: Completo")
                        .font(.body)
                        .bold()
                    Text("Cumple con todas las implementaciones completas y las acciones previas en todas las categorías y subcategorías.")
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
                    Text("Normas Generales")
                        .font(.title2)
                        .bold()
                    Text("Nivel 1: Acciones Básicas")
                        .font(.body)
                        .bold()
                    Text("Señalización Clara y Visible:")
                        .font(.body)
                        .bold()
                    Text( "Colocar señales grandes, con alto contraste y fácil lectura en todas las áreas del evento.")
                    Text("Información Previa: ")
                        .font(.body)
                        .bold()
                    Text("Incluir detalles de accesibilidad en la comunicación previa al evento (sitio web, boletines, entradas)​")
                        Spacer()
                    Text("Nivel 2: Mejoras Moderadas")
                        .font(.body)
                        .bold()
                    Text("Personal Capacitado:")
                        .font(.body)
                        .bold()
                    Text( "Asegurar que todo el personal y voluntarios reciban formación sobre cómo asistir a personas con discapacidades​ ")
                    Text("Zonas de Descanso:")
                        .font(.body)
                        .bold()
                    Text("Proveer áreas tranquilas para descanso y recuperación del estímulo del evento​")
                    Spacer()
                    Text("Nivel 3: Implementaciones Completas")
                        .font(.body)
                        .bold()
                    Text("Asistencia en Sitio:")
                        .font(.body)
                        .bold()
                    Text( "Tener un punto de información accesible donde los asistentes puedan obtener ayuda adicional​ ")
                    Text("Infraestructura Adaptada:")
                        .font(.body)
                        .bold()
                    Text("Asegurar que todas las instalaciones (baños, entradas, caminos) sean completamente accesibles")
                    
                }
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 15)
                        .stroke(Color.gray, lineWidth: 2)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color.white))
                )
                .padding()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text("Subnormas Específicas por Tipo de Discapacidad")
                        .font(.title2)
                        .bold()
                    Text("Discapacidades de Movilidad")
                        .font(.title3)
                        .bold()
                    Text("Nivel 1: Acciones Básicas")
                        .font(.body)
                        .bold()
                    Text("Rutas Accesibles:")
                        .font(.body)
                        .bold()
                    Text( "Proveer rutas sin obstáculos desde el estacionamiento hasta todas las áreas clave del evento​")
                    Text("Asientos Adaptados: ")
                        .font(.body)
                        .bold()
                    Text("Designar áreas para sillas de ruedas con buena visibilidad y acceso a servicios")
                        Spacer()
                    Text("Nivel 2: Mejoras Moderadas")
                        .font(.body)
                        .bold()
                    Text("Rampas y Elevadores: ")
                        .font(.body)
                        .bold()
                    Text( "Instalar rampas de suave inclinación y ascensores accesibles en todas las áreas necesarias")
                    Text("Espacio Adicional: ")
                        .font(.body)
                        .bold()
                    Text("Asegurar espacios adicionales para movilidad y dispositivos de asistencia como scooters y caminadores")
                    Spacer()
                    Text("Nivel 3: Implementaciones Completas")
                        .font(.body)
                        .bold()
                    Text("Baños Adaptados:")
                        .font(.body)
                        .bold()
                    Text( "Garantizar la disponibilidad de baños accesibles en todas las áreas del evento​")
                    Text("Asientos Flexibles:")
                        .font(.body)
                        .bold()
                    Text("Ofrecer una variedad de opciones de asientos, incluyendo sillas con apoyabrazos y alturas ajustables")
                    Spacer()
                    
                    Text("Discapacidades Visuales")
                        .font(.title3)
                        .bold()
                    Text("Nivel 1: Acciones Básicas")
                        .font(.body)
                        .bold()
                    Text("Textos en Gran Formato: ")
                        .font(.body)
                        .bold()
                    Text( "Proveer materiales impresos en fuentes grandes y de alto contraste​ ")
                    Text("Guías de Asistencia: ")
                        .font(.body)
                        .bold()
                    Text("Permitir el acceso de perros guía y facilitar el movimiento con bastones blancos")
                        Spacer()
                    Text("Nivel 2: Mejoras Moderadas")
                        .font(.body)
                        .bold()
                    Text("Iluminación Adecuada: ")
                        .font(.body)
                        .bold()
                    Text( "Asegurar buena iluminación en todas las áreas y eliminar obstáculos que puedan causar accidentes")
                    Text("Mapas Táctiles: ")
                        .font(.body)
                        .bold()
                    Text("Proveer mapas táctiles y señalización en braille en puntos clave del evento​ ")
                    Spacer()
                    Text("Nivel 3: Implementaciones Completas")
                        .font(.body)
                        .bold()
                    Text("Tecnología Asistiva:")
                        .font(.body)
                        .bold()
                    Text( "Ofrecer dispositivos tecnológicos como aplicaciones de navegación para personas con discapacidad visual​ ")
                    Text("Señalización Auditiva: ")
                        .font(.body)
                        .bold()
                    Text("Implementar señalización auditiva para guiar a los asistentes dentro del evento​ ")
                    Spacer()
                    
                    Text("Discapacidades Auditivas")
                        .font(.title3)
                        .bold()
                    Text("Nivel 1: Acciones Básicas")
                        .font(.body)
                        .bold()
                    Text("Subtítulos: ")
                        .font(.body)
                        .bold()
                    Text( "Incluir subtítulos en todas las presentaciones y videos​  ")
                    Text("Micrófonos: ")
                        .font(.body)
                        .bold()
                    Text("Asegurar que todos los oradores usen micrófonos para facilitar la lectura labial y el uso de dispositivos auditivos")
                        Spacer()
                    Text("Nivel 2: Mejoras Moderadas")
                        .font(.body)
                        .bold()
                    Text("Interpretes de Lengua de Señas:")
                        .font(.body)
                        .bold()
                    Text( " Proveer intérpretes de lengua de señas en eventos y presentaciones importantes​")
                    Text("Dispositivos de Asistencia Auditiva: ")
                        .font(.body)
                        .bold()
                    Text("Ofrecer sistemas de bucle inductivo y dispositivos de asistencia auditiva​")
                    Spacer()
                    Text("Nivel 3: Implementaciones Completas")
                        .font(.body)
                        .bold()
                    Text("Notificación Visual: ")
                        .font(.body)
                        .bold()
                    Text( "Asegurar que todos los anuncios sonoros también se transmitan visualmente​")
                    Text("Documentos Escritos: ")
                        .font(.body)
                        .bold()
                    Text("Proveer materiales escritos para acompañar todas las presentaciones orales")
                    Spacer()
                                        
                    Text("Discapacidades Cognitivas y Psicológicas")
                        .font(.title3)
                        .bold()
                    Text("Nivel 1: Acciones Básicas")
                        .font(.body)
                        .bold()
                    Text("Comunicación Clara: ")
                        .font(.body)
                        .bold()
                    Text( "Usar un lenguaje claro y sencillo en todos los materiales y señalización​ ")
                    Text("Información Previa: ")
                        .font(.body)
                        .bold()
                    Text("Informar claramente sobre el entorno del evento y posibles estímulos sensoriales​ ")
                        Spacer()
                    Text("Nivel 2: Mejoras Moderadas")
                        .font(.body)
                        .bold()
                    Text("Espacios Tranquilos: ")
                        .font(.body)
                        .bold()
                    Text( "Crear áreas tranquilas para relajarse y evitar el estrés sensorial​ ")
                    Text("Personal de Apoyo: ")
                        .font(.body)
                        .bold()
                    Text("Tener personal capacitado para asistir a personas con necesidades cognitivas específicas")
                    Spacer()
                    Text("Nivel 3: Implementaciones Completas")
                        .font(.body)
                        .bold()
                    Text("Ambientes Controlados: ")
                        .font(.body)
                        .bold()
                    Text( "Evitar luces estroboscópicas y ruidos fuertes que puedan desencadenar respuestas negativas​")
                    Text("Materiales Adaptados: ")
                        .font(.body)
                        .bold()
                    Text("Proveer materiales educativos y de navegación adaptados a diversas necesidades cognitivas")
                    
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
}

#Preview{
    FAQView()
}
