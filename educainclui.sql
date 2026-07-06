--
-- PostgreSQL database dump
--

\restrict hhkdsiF1g5QWTyZXCXnP3xiqcXE4EKUwzNjBWWde4dbGDyVhalXKocdTaaZ0jG0

-- Dumped from database version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)
-- Dumped by pg_dump version 16.13 (Ubuntu 16.13-0ubuntu0.24.04.1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS '';


--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alternativas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alternativas (
    id_alternativa integer NOT NULL,
    id_questao integer NOT NULL,
    texto_alternativa text NOT NULL,
    e_correta boolean DEFAULT false NOT NULL
);


ALTER TABLE public.alternativas OWNER TO postgres;

--
-- Name: alternativas_id_alternativa_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alternativas_id_alternativa_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.alternativas_id_alternativa_seq OWNER TO postgres;

--
-- Name: alternativas_id_alternativa_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alternativas_id_alternativa_seq OWNED BY public.alternativas.id_alternativa;


--
-- Name: cards_memorizacao_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards_memorizacao_usuario (
    id_card_usuario integer NOT NULL,
    id_deck integer NOT NULL,
    pergunta text NOT NULL,
    resposta text NOT NULL,
    proxima_revisao timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    intervalo_dias integer DEFAULT 1,
    facilidade_efetiva real DEFAULT 2.5
);


ALTER TABLE public.cards_memorizacao_usuario OWNER TO postgres;

--
-- Name: cards_memorizacao_usuario_id_card_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_memorizacao_usuario_id_card_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cards_memorizacao_usuario_id_card_usuario_seq OWNER TO postgres;

--
-- Name: cards_memorizacao_usuario_id_card_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_memorizacao_usuario_id_card_usuario_seq OWNED BY public.cards_memorizacao_usuario.id_card_usuario;


--
-- Name: conquistas_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conquistas_usuario (
    id_conquista_usuario integer NOT NULL,
    id_usuario integer NOT NULL,
    id_conquista integer NOT NULL,
    data_desbloqueio timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.conquistas_usuario OWNER TO postgres;

--
-- Name: conquistas_usuario_id_conquista_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conquistas_usuario_id_conquista_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conquistas_usuario_id_conquista_usuario_seq OWNER TO postgres;

--
-- Name: conquistas_usuario_id_conquista_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conquistas_usuario_id_conquista_usuario_seq OWNED BY public.conquistas_usuario.id_conquista_usuario;


--
-- Name: conteudos_licao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.conteudos_licao (
    id_conteudo integer NOT NULL,
    id_licao integer NOT NULL,
    tipo_formato character varying(30) NOT NULL,
    corpo_conteudo text NOT NULL,
    tags_ia jsonb,
    CONSTRAINT conteudos_licao_tipo_formato_check CHECK (((tipo_formato)::text = ANY ((ARRAY['Texto Adaptado'::character varying, 'Flashcard'::character varying, 'Audio'::character varying, 'Mapa Mental'::character varying, 'Video'::character varying])::text[])))
);


ALTER TABLE public.conteudos_licao OWNER TO postgres;

--
-- Name: conteudos_licao_id_conteudo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.conteudos_licao_id_conteudo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.conteudos_licao_id_conteudo_seq OWNER TO postgres;

--
-- Name: conteudos_licao_id_conteudo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.conteudos_licao_id_conteudo_seq OWNED BY public.conteudos_licao.id_conteudo;


--
-- Name: cursos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cursos (
    id_curso integer NOT NULL,
    nome_curso character varying(100) NOT NULL,
    descricao text,
    categoria character varying(50),
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.cursos OWNER TO postgres;

--
-- Name: cursos_id_curso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cursos_id_curso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cursos_id_curso_seq OWNER TO postgres;

--
-- Name: cursos_id_curso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cursos_id_curso_seq OWNED BY public.cursos.id_curso;


--
-- Name: decks_flashcards_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.decks_flashcards_usuario (
    id_deck integer NOT NULL,
    id_usuario integer NOT NULL,
    id_modulo integer,
    nome_deck character varying(100) NOT NULL
);


ALTER TABLE public.decks_flashcards_usuario OWNER TO postgres;

--
-- Name: decks_flashcards_usuario_id_deck_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.decks_flashcards_usuario_id_deck_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.decks_flashcards_usuario_id_deck_seq OWNER TO postgres;

--
-- Name: decks_flashcards_usuario_id_deck_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.decks_flashcards_usuario_id_deck_seq OWNED BY public.decks_flashcards_usuario.id_deck;


--
-- Name: feedback_acessibilidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback_acessibilidade (
    id_feedback integer NOT NULL,
    id_usuario integer NOT NULL,
    id_licao integer NOT NULL,
    nivel_dificuldade integer,
    comentario text,
    data_envio timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT feedback_acessibilidade_nivel_dificuldade_check CHECK (((nivel_dificuldade >= 1) AND (nivel_dificuldade <= 5)))
);


ALTER TABLE public.feedback_acessibilidade OWNER TO postgres;

--
-- Name: feedback_acessibilidade_id_feedback_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_acessibilidade_id_feedback_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_acessibilidade_id_feedback_seq OWNER TO postgres;

--
-- Name: feedback_acessibilidade_id_feedback_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_acessibilidade_id_feedback_seq OWNED BY public.feedback_acessibilidade.id_feedback;


--
-- Name: forum_respostas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_respostas (
    id_resposta integer NOT NULL,
    id_topico integer NOT NULL,
    id_usuario integer NOT NULL,
    resposta_texto text NOT NULL,
    data_resposta timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.forum_respostas OWNER TO postgres;

--
-- Name: forum_respostas_id_resposta_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_respostas_id_resposta_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forum_respostas_id_resposta_seq OWNER TO postgres;

--
-- Name: forum_respostas_id_resposta_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_respostas_id_resposta_seq OWNED BY public.forum_respostas.id_resposta;


--
-- Name: forum_topicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forum_topicos (
    id_topico integer NOT NULL,
    id_usuario integer NOT NULL,
    titulo_topico character varying(150) NOT NULL,
    mensagem_principal text NOT NULL,
    data_criacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.forum_topicos OWNER TO postgres;

--
-- Name: forum_topicos_id_topico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.forum_topicos_id_topico_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.forum_topicos_id_topico_seq OWNER TO postgres;

--
-- Name: forum_topicos_id_topico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.forum_topicos_id_topico_seq OWNED BY public.forum_topicos.id_topico;


--
-- Name: licoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.licoes (
    id_licao integer NOT NULL,
    id_modulo integer NOT NULL,
    titulo_licao character varying(100) NOT NULL,
    ordem integer NOT NULL
);


ALTER TABLE public.licoes OWNER TO postgres;

--
-- Name: licoes_id_licao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.licoes_id_licao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.licoes_id_licao_seq OWNER TO postgres;

--
-- Name: licoes_id_licao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.licoes_id_licao_seq OWNED BY public.licoes.id_licao;


--
-- Name: logs_aprendizado_ia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.logs_aprendizado_ia (
    id_log integer NOT NULL,
    id_usuario integer NOT NULL,
    metrica_analisada character varying(100),
    recomendacao_ia text,
    data_analise timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.logs_aprendizado_ia OWNER TO postgres;

--
-- Name: logs_aprendizado_ia_id_log_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.logs_aprendizado_ia_id_log_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.logs_aprendizado_ia_id_log_seq OWNER TO postgres;

--
-- Name: logs_aprendizado_ia_id_log_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.logs_aprendizado_ia_id_log_seq OWNED BY public.logs_aprendizado_ia.id_log;


--
-- Name: mapeamento_revisao_ia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.mapeamento_revisao_ia (
    id_mapeamento integer NOT NULL,
    id_questao integer NOT NULL,
    id_conteudo_recomendado integer NOT NULL
);


ALTER TABLE public.mapeamento_revisao_ia OWNER TO postgres;

--
-- Name: mapeamento_revisao_ia_id_mapeamento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.mapeamento_revisao_ia_id_mapeamento_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.mapeamento_revisao_ia_id_mapeamento_seq OWNER TO postgres;

--
-- Name: mapeamento_revisao_ia_id_mapeamento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.mapeamento_revisao_ia_id_mapeamento_seq OWNED BY public.mapeamento_revisao_ia.id_mapeamento;


--
-- Name: matriculas_turma; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.matriculas_turma (
    id_matricula integer NOT NULL,
    id_turma integer NOT NULL,
    id_aluno integer NOT NULL,
    data_matricula timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.matriculas_turma OWNER TO postgres;

--
-- Name: matriculas_turma_id_matricula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.matriculas_turma_id_matricula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.matriculas_turma_id_matricula_seq OWNER TO postgres;

--
-- Name: matriculas_turma_id_matricula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.matriculas_turma_id_matricula_seq OWNED BY public.matriculas_turma.id_matricula;


--
-- Name: modulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.modulos (
    id_modulo integer NOT NULL,
    id_curso integer NOT NULL,
    titulo_modulo character varying(100) NOT NULL,
    ordem integer NOT NULL
);


ALTER TABLE public.modulos OWNER TO postgres;

--
-- Name: modulos_id_modulo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.modulos_id_modulo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.modulos_id_modulo_seq OWNER TO postgres;

--
-- Name: modulos_id_modulo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.modulos_id_modulo_seq OWNED BY public.modulos.id_modulo;


--
-- Name: notificacoes_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.notificacoes_usuario (
    id_notificacao integer NOT NULL,
    id_usuario integer NOT NULL,
    titulo_notificacao character varying(100) NOT NULL,
    mensagem text NOT NULL,
    lida boolean DEFAULT false,
    data_envio timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.notificacoes_usuario OWNER TO postgres;

--
-- Name: notificacoes_usuario_id_notificacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.notificacoes_usuario_id_notificacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.notificacoes_usuario_id_notificacao_seq OWNER TO postgres;

--
-- Name: notificacoes_usuario_id_notificacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.notificacoes_usuario_id_notificacao_seq OWNED BY public.notificacoes_usuario.id_notificacao;


--
-- Name: perfis_acessibilidade; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.perfis_acessibilidade (
    id_perfil integer NOT NULL,
    id_usuario integer NOT NULL,
    condicao_neuro character varying(100),
    tamanho_fonte character varying(10) DEFAULT 'padrao'::character varying,
    alto_contraste boolean DEFAULT false,
    modo_leitura_tela boolean DEFAULT false,
    preferencia_midia character varying(30) DEFAULT 'Texto'::character varying,
    tempo_foco_estimado integer DEFAULT 20,
    CONSTRAINT perfis_acessibilidade_preferencia_midia_check CHECK (((preferencia_midia)::text = ANY ((ARRAY['Texto'::character varying, 'Audio'::character varying, 'Video'::character varying, 'Mapa Mental'::character varying])::text[])))
);


ALTER TABLE public.perfis_acessibilidade OWNER TO postgres;

--
-- Name: perfis_acessibilidade_id_perfil_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.perfis_acessibilidade_id_perfil_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.perfis_acessibilidade_id_perfil_seq OWNER TO postgres;

--
-- Name: perfis_acessibilidade_id_perfil_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.perfis_acessibilidade_id_perfil_seq OWNED BY public.perfis_acessibilidade.id_perfil;


--
-- Name: progresso_gamificacao; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.progresso_gamificacao (
    id_gamificacao integer NOT NULL,
    id_usuario integer NOT NULL,
    pontos_acumulados integer DEFAULT 0,
    nivel_atual integer DEFAULT 1,
    xp_total integer DEFAULT 0
);


ALTER TABLE public.progresso_gamificacao OWNER TO postgres;

--
-- Name: progresso_gamificacao_id_gamificacao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.progresso_gamificacao_id_gamificacao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.progresso_gamificacao_id_gamificacao_seq OWNER TO postgres;

--
-- Name: progresso_gamificacao_id_gamificacao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.progresso_gamificacao_id_gamificacao_seq OWNED BY public.progresso_gamificacao.id_gamificacao;


--
-- Name: progresso_licoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.progresso_licoes (
    id_progresso integer NOT NULL,
    id_usuario integer NOT NULL,
    id_licao integer NOT NULL,
    status character varying(20) DEFAULT 'Não Iniciado'::character varying NOT NULL,
    ultima_interacao timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT progresso_licoes_status_check CHECK (((status)::text = ANY ((ARRAY['Não Iniciado'::character varying, 'Em Andamento'::character varying, 'Concluido'::character varying])::text[])))
);


ALTER TABLE public.progresso_licoes OWNER TO postgres;

--
-- Name: progresso_licoes_id_progresso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.progresso_licoes_id_progresso_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.progresso_licoes_id_progresso_seq OWNER TO postgres;

--
-- Name: progresso_licoes_id_progresso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.progresso_licoes_id_progresso_seq OWNED BY public.progresso_licoes.id_progresso;


--
-- Name: questoes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.questoes (
    id_questao integer NOT NULL,
    id_quiz integer NOT NULL,
    enunciado text NOT NULL,
    dica_acessibilidade text,
    nivel_dificuldade character varying(20) DEFAULT 'Medio'::character varying,
    CONSTRAINT questoes_nivel_dificuldade_check CHECK (((nivel_dificuldade)::text = ANY ((ARRAY['Facil'::character varying, 'Medio'::character varying, 'Dificil'::character varying])::text[])))
);


ALTER TABLE public.questoes OWNER TO postgres;

--
-- Name: questoes_id_questao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.questoes_id_questao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.questoes_id_questao_seq OWNER TO postgres;

--
-- Name: questoes_id_questao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.questoes_id_questao_seq OWNED BY public.questoes.id_questao;


--
-- Name: quizzes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.quizzes (
    id_quiz integer NOT NULL,
    id_licao integer NOT NULL,
    titulo_quiz character varying(100) NOT NULL,
    pontos_recompensa integer DEFAULT 10
);


ALTER TABLE public.quizzes OWNER TO postgres;

--
-- Name: quizzes_id_quiz_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.quizzes_id_quiz_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.quizzes_id_quiz_seq OWNER TO postgres;

--
-- Name: quizzes_id_quiz_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.quizzes_id_quiz_seq OWNED BY public.quizzes.id_quiz;


--
-- Name: recompensas_conquistas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.recompensas_conquistas (
    id_conquista integer NOT NULL,
    nome_conquista character varying(100) NOT NULL,
    descricao text NOT NULL,
    pontos_necessarios integer DEFAULT 0 NOT NULL,
    badge_url character varying(255)
);


ALTER TABLE public.recompensas_conquistas OWNER TO postgres;

--
-- Name: recompensas_conquistas_id_conquista_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.recompensas_conquistas_id_conquista_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.recompensas_conquistas_id_conquista_seq OWNER TO postgres;

--
-- Name: recompensas_conquistas_id_conquista_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.recompensas_conquistas_id_conquista_seq OWNED BY public.recompensas_conquistas.id_conquista;


--
-- Name: respostas_usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.respostas_usuario (
    id_resposta_usuario integer NOT NULL,
    id_usuario integer NOT NULL,
    id_questao integer NOT NULL,
    id_alternativa_marcada integer NOT NULL,
    data_resposta timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.respostas_usuario OWNER TO postgres;

--
-- Name: respostas_usuario_id_resposta_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.respostas_usuario_id_resposta_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.respostas_usuario_id_resposta_usuario_seq OWNER TO postgres;

--
-- Name: respostas_usuario_id_resposta_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.respostas_usuario_id_resposta_usuario_seq OWNED BY public.respostas_usuario.id_resposta_usuario;


--
-- Name: sessoes_estudo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessoes_estudo (
    id_sessao integer NOT NULL,
    id_usuario integer NOT NULL,
    id_licao integer NOT NULL,
    data_inicio timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    tempo_duracao_segundos integer DEFAULT 0
);


ALTER TABLE public.sessoes_estudo OWNER TO postgres;

--
-- Name: sessoes_estudo_id_sessao_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sessoes_estudo_id_sessao_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sessoes_estudo_id_sessao_seq OWNER TO postgres;

--
-- Name: sessoes_estudo_id_sessao_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sessoes_estudo_id_sessao_seq OWNED BY public.sessoes_estudo.id_sessao;


--
-- Name: turmas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.turmas (
    id_turma integer NOT NULL,
    id_professor integer,
    nome_turma character varying(100) NOT NULL,
    ano_letivo integer NOT NULL,
    codigo_acesso character varying(20) NOT NULL
);


ALTER TABLE public.turmas OWNER TO postgres;

--
-- Name: turmas_id_turma_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.turmas_id_turma_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.turmas_id_turma_seq OWNER TO postgres;

--
-- Name: turmas_id_turma_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.turmas_id_turma_seq OWNED BY public.turmas.id_turma;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    id_usuario integer NOT NULL,
    nome_completo character varying(150) NOT NULL,
    email character varying(100) NOT NULL,
    senha_hash character varying(255) NOT NULL,
    tipo_usuario character varying(20) NOT NULL,
    data_cadastro timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    ativo boolean DEFAULT true,
    CONSTRAINT usuarios_tipo_usuario_check CHECK (((tipo_usuario)::text = ANY ((ARRAY['Aluno'::character varying, 'Professor'::character varying, 'Responsavel'::character varying, 'Administrador'::character varying])::text[])))
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_usuario_seq OWNER TO postgres;

--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_usuario_seq OWNED BY public.usuarios.id_usuario;


--
-- Name: vinculo_responsaveis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vinculo_responsaveis (
    id_vinculo integer NOT NULL,
    id_responsavel integer NOT NULL,
    id_aluno integer NOT NULL,
    data_vinculo timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.vinculo_responsaveis OWNER TO postgres;

--
-- Name: vinculo_responsaveis_id_vinculo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vinculo_responsaveis_id_vinculo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.vinculo_responsaveis_id_vinculo_seq OWNER TO postgres;

--
-- Name: vinculo_responsaveis_id_vinculo_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vinculo_responsaveis_id_vinculo_seq OWNED BY public.vinculo_responsaveis.id_vinculo;


--
-- Name: alternativas id_alternativa; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alternativas ALTER COLUMN id_alternativa SET DEFAULT nextval('public.alternativas_id_alternativa_seq'::regclass);


--
-- Name: cards_memorizacao_usuario id_card_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards_memorizacao_usuario ALTER COLUMN id_card_usuario SET DEFAULT nextval('public.cards_memorizacao_usuario_id_card_usuario_seq'::regclass);


--
-- Name: conquistas_usuario id_conquista_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conquistas_usuario ALTER COLUMN id_conquista_usuario SET DEFAULT nextval('public.conquistas_usuario_id_conquista_usuario_seq'::regclass);


--
-- Name: conteudos_licao id_conteudo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudos_licao ALTER COLUMN id_conteudo SET DEFAULT nextval('public.conteudos_licao_id_conteudo_seq'::regclass);


--
-- Name: cursos id_curso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos ALTER COLUMN id_curso SET DEFAULT nextval('public.cursos_id_curso_seq'::regclass);


--
-- Name: decks_flashcards_usuario id_deck; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks_flashcards_usuario ALTER COLUMN id_deck SET DEFAULT nextval('public.decks_flashcards_usuario_id_deck_seq'::regclass);


--
-- Name: feedback_acessibilidade id_feedback; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback_acessibilidade ALTER COLUMN id_feedback SET DEFAULT nextval('public.feedback_acessibilidade_id_feedback_seq'::regclass);


--
-- Name: forum_respostas id_resposta; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_respostas ALTER COLUMN id_resposta SET DEFAULT nextval('public.forum_respostas_id_resposta_seq'::regclass);


--
-- Name: forum_topicos id_topico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_topicos ALTER COLUMN id_topico SET DEFAULT nextval('public.forum_topicos_id_topico_seq'::regclass);


--
-- Name: licoes id_licao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licoes ALTER COLUMN id_licao SET DEFAULT nextval('public.licoes_id_licao_seq'::regclass);


--
-- Name: logs_aprendizado_ia id_log; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_aprendizado_ia ALTER COLUMN id_log SET DEFAULT nextval('public.logs_aprendizado_ia_id_log_seq'::regclass);


--
-- Name: mapeamento_revisao_ia id_mapeamento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapeamento_revisao_ia ALTER COLUMN id_mapeamento SET DEFAULT nextval('public.mapeamento_revisao_ia_id_mapeamento_seq'::regclass);


--
-- Name: matriculas_turma id_matricula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas_turma ALTER COLUMN id_matricula SET DEFAULT nextval('public.matriculas_turma_id_matricula_seq'::regclass);


--
-- Name: modulos id_modulo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos ALTER COLUMN id_modulo SET DEFAULT nextval('public.modulos_id_modulo_seq'::regclass);


--
-- Name: notificacoes_usuario id_notificacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacoes_usuario ALTER COLUMN id_notificacao SET DEFAULT nextval('public.notificacoes_usuario_id_notificacao_seq'::regclass);


--
-- Name: perfis_acessibilidade id_perfil; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfis_acessibilidade ALTER COLUMN id_perfil SET DEFAULT nextval('public.perfis_acessibilidade_id_perfil_seq'::regclass);


--
-- Name: progresso_gamificacao id_gamificacao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_gamificacao ALTER COLUMN id_gamificacao SET DEFAULT nextval('public.progresso_gamificacao_id_gamificacao_seq'::regclass);


--
-- Name: progresso_licoes id_progresso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_licoes ALTER COLUMN id_progresso SET DEFAULT nextval('public.progresso_licoes_id_progresso_seq'::regclass);


--
-- Name: questoes id_questao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes ALTER COLUMN id_questao SET DEFAULT nextval('public.questoes_id_questao_seq'::regclass);


--
-- Name: quizzes id_quiz; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes ALTER COLUMN id_quiz SET DEFAULT nextval('public.quizzes_id_quiz_seq'::regclass);


--
-- Name: recompensas_conquistas id_conquista; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recompensas_conquistas ALTER COLUMN id_conquista SET DEFAULT nextval('public.recompensas_conquistas_id_conquista_seq'::regclass);


--
-- Name: respostas_usuario id_resposta_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respostas_usuario ALTER COLUMN id_resposta_usuario SET DEFAULT nextval('public.respostas_usuario_id_resposta_usuario_seq'::regclass);


--
-- Name: sessoes_estudo id_sessao; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessoes_estudo ALTER COLUMN id_sessao SET DEFAULT nextval('public.sessoes_estudo_id_sessao_seq'::regclass);


--
-- Name: turmas id_turma; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas ALTER COLUMN id_turma SET DEFAULT nextval('public.turmas_id_turma_seq'::regclass);


--
-- Name: usuarios id_usuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id_usuario SET DEFAULT nextval('public.usuarios_id_usuario_seq'::regclass);


--
-- Name: vinculo_responsaveis id_vinculo; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_responsaveis ALTER COLUMN id_vinculo SET DEFAULT nextval('public.vinculo_responsaveis_id_vinculo_seq'::regclass);


--
-- Data for Name: alternativas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alternativas (id_alternativa, id_questao, texto_alternativa, e_correta) FROM stdin;
\.


--
-- Data for Name: cards_memorizacao_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards_memorizacao_usuario (id_card_usuario, id_deck, pergunta, resposta, proxima_revisao, intervalo_dias, facilidade_efetiva) FROM stdin;
\.


--
-- Data for Name: conquistas_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conquistas_usuario (id_conquista_usuario, id_usuario, id_conquista, data_desbloqueio) FROM stdin;
\.


--
-- Data for Name: conteudos_licao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.conteudos_licao (id_conteudo, id_licao, tipo_formato, corpo_conteudo, tags_ia) FROM stdin;
\.


--
-- Data for Name: cursos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cursos (id_curso, nome_curso, descricao, categoria, data_criacao) FROM stdin;
\.


--
-- Data for Name: decks_flashcards_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.decks_flashcards_usuario (id_deck, id_usuario, id_modulo, nome_deck) FROM stdin;
\.


--
-- Data for Name: feedback_acessibilidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback_acessibilidade (id_feedback, id_usuario, id_licao, nivel_dificuldade, comentario, data_envio) FROM stdin;
\.


--
-- Data for Name: forum_respostas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_respostas (id_resposta, id_topico, id_usuario, resposta_texto, data_resposta) FROM stdin;
\.


--
-- Data for Name: forum_topicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forum_topicos (id_topico, id_usuario, titulo_topico, mensagem_principal, data_criacao) FROM stdin;
\.


--
-- Data for Name: licoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.licoes (id_licao, id_modulo, titulo_licao, ordem) FROM stdin;
\.


--
-- Data for Name: logs_aprendizado_ia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.logs_aprendizado_ia (id_log, id_usuario, metrica_analisada, recomendacao_ia, data_analise) FROM stdin;
\.


--
-- Data for Name: mapeamento_revisao_ia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.mapeamento_revisao_ia (id_mapeamento, id_questao, id_conteudo_recomendado) FROM stdin;
\.


--
-- Data for Name: matriculas_turma; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.matriculas_turma (id_matricula, id_turma, id_aluno, data_matricula) FROM stdin;
\.


--
-- Data for Name: modulos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.modulos (id_modulo, id_curso, titulo_modulo, ordem) FROM stdin;
\.


--
-- Data for Name: notificacoes_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.notificacoes_usuario (id_notificacao, id_usuario, titulo_notificacao, mensagem, lida, data_envio) FROM stdin;
\.


--
-- Data for Name: perfis_acessibilidade; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.perfis_acessibilidade (id_perfil, id_usuario, condicao_neuro, tamanho_fonte, alto_contraste, modo_leitura_tela, preferencia_midia, tempo_foco_estimado) FROM stdin;
\.


--
-- Data for Name: progresso_gamificacao; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.progresso_gamificacao (id_gamificacao, id_usuario, pontos_acumulados, nivel_atual, xp_total) FROM stdin;
\.


--
-- Data for Name: progresso_licoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.progresso_licoes (id_progresso, id_usuario, id_licao, status, ultima_interacao) FROM stdin;
\.


--
-- Data for Name: questoes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.questoes (id_questao, id_quiz, enunciado, dica_acessibilidade, nivel_dificuldade) FROM stdin;
\.


--
-- Data for Name: quizzes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.quizzes (id_quiz, id_licao, titulo_quiz, pontos_recompensa) FROM stdin;
\.


--
-- Data for Name: recompensas_conquistas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.recompensas_conquistas (id_conquista, nome_conquista, descricao, pontos_necessarios, badge_url) FROM stdin;
\.


--
-- Data for Name: respostas_usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.respostas_usuario (id_resposta_usuario, id_usuario, id_questao, id_alternativa_marcada, data_resposta) FROM stdin;
\.


--
-- Data for Name: sessoes_estudo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessoes_estudo (id_sessao, id_usuario, id_licao, data_inicio, tempo_duracao_segundos) FROM stdin;
\.


--
-- Data for Name: turmas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.turmas (id_turma, id_professor, nome_turma, ano_letivo, codigo_acesso) FROM stdin;
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (id_usuario, nome_completo, email, senha_hash, tipo_usuario, data_cadastro, ativo) FROM stdin;
\.


--
-- Data for Name: vinculo_responsaveis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.vinculo_responsaveis (id_vinculo, id_responsavel, id_aluno, data_vinculo) FROM stdin;
\.


--
-- Name: alternativas_id_alternativa_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alternativas_id_alternativa_seq', 1, false);


--
-- Name: cards_memorizacao_usuario_id_card_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_memorizacao_usuario_id_card_usuario_seq', 1, false);


--
-- Name: conquistas_usuario_id_conquista_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conquistas_usuario_id_conquista_usuario_seq', 1, false);


--
-- Name: conteudos_licao_id_conteudo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.conteudos_licao_id_conteudo_seq', 1, false);


--
-- Name: cursos_id_curso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cursos_id_curso_seq', 1, false);


--
-- Name: decks_flashcards_usuario_id_deck_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.decks_flashcards_usuario_id_deck_seq', 1, false);


--
-- Name: feedback_acessibilidade_id_feedback_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_acessibilidade_id_feedback_seq', 1, false);


--
-- Name: forum_respostas_id_resposta_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_respostas_id_resposta_seq', 1, false);


--
-- Name: forum_topicos_id_topico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.forum_topicos_id_topico_seq', 1, false);


--
-- Name: licoes_id_licao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.licoes_id_licao_seq', 1, false);


--
-- Name: logs_aprendizado_ia_id_log_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.logs_aprendizado_ia_id_log_seq', 1, false);


--
-- Name: mapeamento_revisao_ia_id_mapeamento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.mapeamento_revisao_ia_id_mapeamento_seq', 1, false);


--
-- Name: matriculas_turma_id_matricula_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.matriculas_turma_id_matricula_seq', 1, false);


--
-- Name: modulos_id_modulo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.modulos_id_modulo_seq', 1, false);


--
-- Name: notificacoes_usuario_id_notificacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.notificacoes_usuario_id_notificacao_seq', 1, false);


--
-- Name: perfis_acessibilidade_id_perfil_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.perfis_acessibilidade_id_perfil_seq', 1, false);


--
-- Name: progresso_gamificacao_id_gamificacao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.progresso_gamificacao_id_gamificacao_seq', 1, false);


--
-- Name: progresso_licoes_id_progresso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.progresso_licoes_id_progresso_seq', 1, false);


--
-- Name: questoes_id_questao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.questoes_id_questao_seq', 1, false);


--
-- Name: quizzes_id_quiz_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.quizzes_id_quiz_seq', 1, false);


--
-- Name: recompensas_conquistas_id_conquista_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.recompensas_conquistas_id_conquista_seq', 1, false);


--
-- Name: respostas_usuario_id_resposta_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.respostas_usuario_id_resposta_usuario_seq', 1, false);


--
-- Name: sessoes_estudo_id_sessao_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sessoes_estudo_id_sessao_seq', 1, false);


--
-- Name: turmas_id_turma_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.turmas_id_turma_seq', 1, false);


--
-- Name: usuarios_id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_usuario_seq', 1, false);


--
-- Name: vinculo_responsaveis_id_vinculo_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vinculo_responsaveis_id_vinculo_seq', 1, false);


--
-- Name: alternativas alternativas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alternativas
    ADD CONSTRAINT alternativas_pkey PRIMARY KEY (id_alternativa);


--
-- Name: cards_memorizacao_usuario cards_memorizacao_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards_memorizacao_usuario
    ADD CONSTRAINT cards_memorizacao_usuario_pkey PRIMARY KEY (id_card_usuario);


--
-- Name: conquistas_usuario conquistas_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conquistas_usuario
    ADD CONSTRAINT conquistas_usuario_pkey PRIMARY KEY (id_conquista_usuario);


--
-- Name: conteudos_licao conteudos_licao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudos_licao
    ADD CONSTRAINT conteudos_licao_pkey PRIMARY KEY (id_conteudo);


--
-- Name: cursos cursos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cursos
    ADD CONSTRAINT cursos_pkey PRIMARY KEY (id_curso);


--
-- Name: decks_flashcards_usuario decks_flashcards_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks_flashcards_usuario
    ADD CONSTRAINT decks_flashcards_usuario_pkey PRIMARY KEY (id_deck);


--
-- Name: feedback_acessibilidade feedback_acessibilidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback_acessibilidade
    ADD CONSTRAINT feedback_acessibilidade_pkey PRIMARY KEY (id_feedback);


--
-- Name: forum_respostas forum_respostas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_respostas
    ADD CONSTRAINT forum_respostas_pkey PRIMARY KEY (id_resposta);


--
-- Name: forum_topicos forum_topicos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_topicos
    ADD CONSTRAINT forum_topicos_pkey PRIMARY KEY (id_topico);


--
-- Name: licoes licoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licoes
    ADD CONSTRAINT licoes_pkey PRIMARY KEY (id_licao);


--
-- Name: logs_aprendizado_ia logs_aprendizado_ia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_aprendizado_ia
    ADD CONSTRAINT logs_aprendizado_ia_pkey PRIMARY KEY (id_log);


--
-- Name: mapeamento_revisao_ia mapeamento_revisao_ia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapeamento_revisao_ia
    ADD CONSTRAINT mapeamento_revisao_ia_pkey PRIMARY KEY (id_mapeamento);


--
-- Name: matriculas_turma matriculas_turma_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas_turma
    ADD CONSTRAINT matriculas_turma_pkey PRIMARY KEY (id_matricula);


--
-- Name: modulos modulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos
    ADD CONSTRAINT modulos_pkey PRIMARY KEY (id_modulo);


--
-- Name: notificacoes_usuario notificacoes_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacoes_usuario
    ADD CONSTRAINT notificacoes_usuario_pkey PRIMARY KEY (id_notificacao);


--
-- Name: perfis_acessibilidade perfis_acessibilidade_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfis_acessibilidade
    ADD CONSTRAINT perfis_acessibilidade_id_usuario_key UNIQUE (id_usuario);


--
-- Name: perfis_acessibilidade perfis_acessibilidade_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfis_acessibilidade
    ADD CONSTRAINT perfis_acessibilidade_pkey PRIMARY KEY (id_perfil);


--
-- Name: progresso_gamificacao progresso_gamificacao_id_usuario_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_gamificacao
    ADD CONSTRAINT progresso_gamificacao_id_usuario_key UNIQUE (id_usuario);


--
-- Name: progresso_gamificacao progresso_gamificacao_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_gamificacao
    ADD CONSTRAINT progresso_gamificacao_pkey PRIMARY KEY (id_gamificacao);


--
-- Name: progresso_licoes progresso_licoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_licoes
    ADD CONSTRAINT progresso_licoes_pkey PRIMARY KEY (id_progresso);


--
-- Name: questoes questoes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes
    ADD CONSTRAINT questoes_pkey PRIMARY KEY (id_questao);


--
-- Name: quizzes quizzes_id_licao_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_id_licao_key UNIQUE (id_licao);


--
-- Name: quizzes quizzes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_pkey PRIMARY KEY (id_quiz);


--
-- Name: recompensas_conquistas recompensas_conquistas_nome_conquista_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recompensas_conquistas
    ADD CONSTRAINT recompensas_conquistas_nome_conquista_key UNIQUE (nome_conquista);


--
-- Name: recompensas_conquistas recompensas_conquistas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.recompensas_conquistas
    ADD CONSTRAINT recompensas_conquistas_pkey PRIMARY KEY (id_conquista);


--
-- Name: respostas_usuario respostas_usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respostas_usuario
    ADD CONSTRAINT respostas_usuario_pkey PRIMARY KEY (id_resposta_usuario);


--
-- Name: sessoes_estudo sessoes_estudo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessoes_estudo
    ADD CONSTRAINT sessoes_estudo_pkey PRIMARY KEY (id_sessao);


--
-- Name: turmas turmas_codigo_acesso_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_codigo_acesso_key UNIQUE (codigo_acesso);


--
-- Name: turmas turmas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_pkey PRIMARY KEY (id_turma);


--
-- Name: matriculas_turma unq_matricula; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas_turma
    ADD CONSTRAINT unq_matricula UNIQUE (id_turma, id_aluno);


--
-- Name: progresso_licoes unq_usuario_licao; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_licoes
    ADD CONSTRAINT unq_usuario_licao UNIQUE (id_usuario, id_licao);


--
-- Name: vinculo_responsaveis unq_vinculo; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_responsaveis
    ADD CONSTRAINT unq_vinculo UNIQUE (id_responsavel, id_aluno);


--
-- Name: usuarios usuarios_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_email_key UNIQUE (email);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id_usuario);


--
-- Name: vinculo_responsaveis vinculo_responsaveis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_responsaveis
    ADD CONSTRAINT vinculo_responsaveis_pkey PRIMARY KEY (id_vinculo);


--
-- Name: alternativas alternativas_id_questao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alternativas
    ADD CONSTRAINT alternativas_id_questao_fkey FOREIGN KEY (id_questao) REFERENCES public.questoes(id_questao) ON DELETE CASCADE;


--
-- Name: cards_memorizacao_usuario cards_memorizacao_usuario_id_deck_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards_memorizacao_usuario
    ADD CONSTRAINT cards_memorizacao_usuario_id_deck_fkey FOREIGN KEY (id_deck) REFERENCES public.decks_flashcards_usuario(id_deck) ON DELETE CASCADE;


--
-- Name: conquistas_usuario conquistas_usuario_id_conquista_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conquistas_usuario
    ADD CONSTRAINT conquistas_usuario_id_conquista_fkey FOREIGN KEY (id_conquista) REFERENCES public.recompensas_conquistas(id_conquista) ON DELETE CASCADE;


--
-- Name: conquistas_usuario conquistas_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conquistas_usuario
    ADD CONSTRAINT conquistas_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: conteudos_licao conteudos_licao_id_licao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.conteudos_licao
    ADD CONSTRAINT conteudos_licao_id_licao_fkey FOREIGN KEY (id_licao) REFERENCES public.licoes(id_licao) ON DELETE CASCADE;


--
-- Name: decks_flashcards_usuario decks_flashcards_usuario_id_modulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks_flashcards_usuario
    ADD CONSTRAINT decks_flashcards_usuario_id_modulo_fkey FOREIGN KEY (id_modulo) REFERENCES public.modulos(id_modulo) ON DELETE SET NULL;


--
-- Name: decks_flashcards_usuario decks_flashcards_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks_flashcards_usuario
    ADD CONSTRAINT decks_flashcards_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: feedback_acessibilidade feedback_acessibilidade_id_licao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback_acessibilidade
    ADD CONSTRAINT feedback_acessibilidade_id_licao_fkey FOREIGN KEY (id_licao) REFERENCES public.licoes(id_licao) ON DELETE CASCADE;


--
-- Name: feedback_acessibilidade feedback_acessibilidade_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback_acessibilidade
    ADD CONSTRAINT feedback_acessibilidade_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: forum_respostas forum_respostas_id_topico_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_respostas
    ADD CONSTRAINT forum_respostas_id_topico_fkey FOREIGN KEY (id_topico) REFERENCES public.forum_topicos(id_topico) ON DELETE CASCADE;


--
-- Name: forum_respostas forum_respostas_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_respostas
    ADD CONSTRAINT forum_respostas_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE SET NULL;


--
-- Name: forum_topicos forum_topicos_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forum_topicos
    ADD CONSTRAINT forum_topicos_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE SET NULL;


--
-- Name: licoes licoes_id_modulo_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.licoes
    ADD CONSTRAINT licoes_id_modulo_fkey FOREIGN KEY (id_modulo) REFERENCES public.modulos(id_modulo) ON DELETE CASCADE;


--
-- Name: logs_aprendizado_ia logs_aprendizado_ia_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.logs_aprendizado_ia
    ADD CONSTRAINT logs_aprendizado_ia_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: mapeamento_revisao_ia mapeamento_revisao_ia_id_conteudo_recomendado_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapeamento_revisao_ia
    ADD CONSTRAINT mapeamento_revisao_ia_id_conteudo_recomendado_fkey FOREIGN KEY (id_conteudo_recomendado) REFERENCES public.conteudos_licao(id_conteudo) ON DELETE CASCADE;


--
-- Name: mapeamento_revisao_ia mapeamento_revisao_ia_id_questao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.mapeamento_revisao_ia
    ADD CONSTRAINT mapeamento_revisao_ia_id_questao_fkey FOREIGN KEY (id_questao) REFERENCES public.questoes(id_questao) ON DELETE CASCADE;


--
-- Name: matriculas_turma matriculas_turma_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas_turma
    ADD CONSTRAINT matriculas_turma_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: matriculas_turma matriculas_turma_id_turma_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.matriculas_turma
    ADD CONSTRAINT matriculas_turma_id_turma_fkey FOREIGN KEY (id_turma) REFERENCES public.turmas(id_turma) ON DELETE CASCADE;


--
-- Name: modulos modulos_id_curso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.modulos
    ADD CONSTRAINT modulos_id_curso_fkey FOREIGN KEY (id_curso) REFERENCES public.cursos(id_curso) ON DELETE CASCADE;


--
-- Name: notificacoes_usuario notificacoes_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.notificacoes_usuario
    ADD CONSTRAINT notificacoes_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: perfis_acessibilidade perfis_acessibilidade_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.perfis_acessibilidade
    ADD CONSTRAINT perfis_acessibilidade_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: progresso_gamificacao progresso_gamificacao_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_gamificacao
    ADD CONSTRAINT progresso_gamificacao_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: progresso_licoes progresso_licoes_id_licao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_licoes
    ADD CONSTRAINT progresso_licoes_id_licao_fkey FOREIGN KEY (id_licao) REFERENCES public.licoes(id_licao) ON DELETE CASCADE;


--
-- Name: progresso_licoes progresso_licoes_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.progresso_licoes
    ADD CONSTRAINT progresso_licoes_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: questoes questoes_id_quiz_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.questoes
    ADD CONSTRAINT questoes_id_quiz_fkey FOREIGN KEY (id_quiz) REFERENCES public.quizzes(id_quiz) ON DELETE CASCADE;


--
-- Name: quizzes quizzes_id_licao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.quizzes
    ADD CONSTRAINT quizzes_id_licao_fkey FOREIGN KEY (id_licao) REFERENCES public.licoes(id_licao) ON DELETE CASCADE;


--
-- Name: respostas_usuario respostas_usuario_id_alternativa_marcada_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respostas_usuario
    ADD CONSTRAINT respostas_usuario_id_alternativa_marcada_fkey FOREIGN KEY (id_alternativa_marcada) REFERENCES public.alternativas(id_alternativa) ON DELETE CASCADE;


--
-- Name: respostas_usuario respostas_usuario_id_questao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respostas_usuario
    ADD CONSTRAINT respostas_usuario_id_questao_fkey FOREIGN KEY (id_questao) REFERENCES public.questoes(id_questao) ON DELETE CASCADE;


--
-- Name: respostas_usuario respostas_usuario_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.respostas_usuario
    ADD CONSTRAINT respostas_usuario_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: sessoes_estudo sessoes_estudo_id_licao_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessoes_estudo
    ADD CONSTRAINT sessoes_estudo_id_licao_fkey FOREIGN KEY (id_licao) REFERENCES public.licoes(id_licao) ON DELETE CASCADE;


--
-- Name: sessoes_estudo sessoes_estudo_id_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessoes_estudo
    ADD CONSTRAINT sessoes_estudo_id_usuario_fkey FOREIGN KEY (id_usuario) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: turmas turmas_id_professor_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.turmas
    ADD CONSTRAINT turmas_id_professor_fkey FOREIGN KEY (id_professor) REFERENCES public.usuarios(id_usuario) ON DELETE SET NULL;


--
-- Name: vinculo_responsaveis vinculo_responsaveis_id_aluno_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_responsaveis
    ADD CONSTRAINT vinculo_responsaveis_id_aluno_fkey FOREIGN KEY (id_aluno) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: vinculo_responsaveis vinculo_responsaveis_id_responsavel_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vinculo_responsaveis
    ADD CONSTRAINT vinculo_responsaveis_id_responsavel_fkey FOREIGN KEY (id_responsavel) REFERENCES public.usuarios(id_usuario) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict hhkdsiF1g5QWTyZXCXnP3xiqcXE4EKUwzNjBWWde4dbGDyVhalXKocdTaaZ0jG0

