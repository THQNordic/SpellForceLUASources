-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 315.898895 , 420.614868 , 33.376194 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(313.230,414.975,32.830);]] )
   Camera:MotionSpline_AddSplinePoint( 315.781219 , 421.224792 , 33.255219 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 314.565796 , 423.002258 , 33.195221 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 313.175293 , 424.339691 , 33.405220 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 100.000000 )
   Camera:MotionSpline_SetCorrection( 0.195313 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
