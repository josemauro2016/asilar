package asilar.model.service;

import asilar.model.ConnectionManager;
import asilar.model.dao.ProdutoDAO;
import asilar.model.entity.Produto;
import asilar.model.service.base.BaseProdutoService;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProdutoService implements BaseProdutoService {

    @Override
    public void create(Produto entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        try {
            ProdutoDAO dao = new ProdutoDAO();
            dao.create(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
            throw e;
        }
    }

    @Override
    public Produto readyById(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Produto entity = new Produto();
        ProdutoDAO dao = new ProdutoDAO();
        try {
            entity = dao.readyById(conn, id);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
            throw e;
        }
        return entity;
    }

    @Override
    public List<Produto> readByCriteria(Map<Long, Object> Criteria, Long offset) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        List<Produto> entityList = new ArrayList<Produto>();
        ProdutoDAO dao = new ProdutoDAO();
        try {
            entityList = dao.readByCriteria(conn, Criteria, offset);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
            throw e;
        }
        return entityList;
    }

    @Override
    public Map<String, String> validateForCreate(Map<String, Object> fields) throws Exception {
        Map<String, String> errors = new HashMap<String, String>();

        Produto produto = (Produto) fields.get("produto");
        if (produto.getNome() == null || produto.getNome().isEmpty()) {
            errors.put("nome", "Campo obrigatório");
        } else if (produto.getQuantidadeMinima() == null || produto.getQuantidadeMinima() == 0) {
            errors.put("quantidadeMinima", "Este campo deve possuir um valor maior que zero");
        } else if (produto.getQuantidadeMaxima() == null || produto.getQuantidadeMaxima() == 0) {
            errors.put("quantidadeMaxima", "Este campo deve possuir um valor maior que zero");
        } else if (produto.getUnidadeMedida() == null || produto.getUnidadeMedida().isEmpty()) {
            errors.put("unidadeMedida", "Este campo deve ser preenchido");
        }

        if (produto.getQuantidadeMaxima() != null && produto.getQuantidadeMinima() != null) {
            if (produto.getQuantidadeMaxima() <= produto.getQuantidadeMinima()) {
                errors.put("quantidadeMaxima", "A quantidade maxima deve ser maior que a quantidade minima!");
            }
        }

        return errors;
    }

    @Override
    public Long countByCriteria(Map<Long, Object> criteria) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        Long count = 0L;
        ProdutoDAO dao = new ProdutoDAO();
        try {
            count = dao.countByCriteria(conn, criteria);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
            throw e;
        }
        return count;
    }

    @Override
    public void update(Produto entity) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        ProdutoDAO dao = new ProdutoDAO();
        try {
            dao.update(conn, entity);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
            throw e;
        }
    }

    @Override
    public void delete(Long id) throws Exception {
        Connection conn = ConnectionManager.getInstance().getConnection();
        ProdutoDAO dao = new ProdutoDAO();
        try {
            dao.delete(conn, id);
            conn.commit();
            conn.close();
        } catch (Exception e) {
            conn.rollback();
            conn.close();
            throw e;
        }
    }

    @Override
    public Map<String, String> validateForUpdate(Map<String, Object> fields) throws Exception {
        return this.validateForCreate(fields);
    }

}
