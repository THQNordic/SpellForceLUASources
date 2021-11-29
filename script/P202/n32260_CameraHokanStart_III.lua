-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 488.204071 , 596.328186 , 11.413227 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(0);]] )
   Camera:MotionSpline_AddSplinePoint( 490.437469 , 598.321045 , 11.413227 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 493.885193 , 599.381836 , 11.413227 , 0.000000 , [[]] )
   Camera:MotionSpline_AddSplinePoint( 497.908203 , 599.804504 , 11.413227 , 0.000000 , [[]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 15.000000 )
   Camera:MotionSpline_SetCorrection( 0.351563 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
