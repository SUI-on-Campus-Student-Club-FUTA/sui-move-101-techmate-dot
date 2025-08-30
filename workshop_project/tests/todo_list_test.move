    #[test_only]
module workshop_project::todo_list_test{
    const ENotFound: u64 = 1000;


    use workshop_project::todo_list::{TodoList, Self};
    #[test_only]
    fun test_create_list(): TodoList{
        let ctx = &mut tx_context::dummy();
        todo_list::new(ctx)
    }
    #[test]
    fun tes_todo_list(){
        
        let mut list = test_create_list();
        todo_list::add(&mut list, b"wash my clothes!".to_string());

        assert!(todo_list::get_item(&list, 0)  == b"wash my clothes!".to_string(), ENotFound);

        //add 2 more items to the list
        //check if the length of the list is 3!
        todo_list::add(&mut list, b"wash my clothes!".to_string());
        todo_list::add(&mut list, b"do the dishes!".to_string());
        assert!(todo_list::length(&list) == 3, ENotFound);
        todo_list::delete(list);


    }
}