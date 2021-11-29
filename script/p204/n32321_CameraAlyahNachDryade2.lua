-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 234.043167 , 279.222473 , 17.616184 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(176.618,299.973,23.177);]] )
   Camera:MotionSpline_AddSplinePoint( 236.043152 , 278.222473 , 17.616184 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 236.043152 , 278.222473 , 17.616184 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 234.181824 , 279.954224 , 17.616184 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.039063 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
