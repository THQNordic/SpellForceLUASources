-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 507.644196 , 350.745514 , 21.673229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8792);]] )
   Camera:MotionSpline_AddSplinePoint( 507.644196 , 350.745514 , 21.673229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8792);]] )
   Camera:MotionSpline_AddSplinePoint( 507.644196 , 350.745514 , 21.673229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8792);]] )
   Camera:MotionSpline_AddSplinePoint( 507.644196 , 350.745514 , 21.673229 , 0.000000 , [[Camera:ScriptSplineLookAtNpc(8792);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.117188 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
