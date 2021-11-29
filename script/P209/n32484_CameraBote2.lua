-- Motion Spline Script:

--<Preparing>----------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_Reset()
   Camera:MotionSpline_SetBehaviour( 0 )
--<Setup Spline>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_AddSplinePoint( 405.044159 , 322.350128 , 23.693230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(394.545,328.598,15.280);]] )
   Camera:MotionSpline_AddSplinePoint( 405.044159 , 322.350128 , 23.693230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(394.545,328.598,15.280);]] )
   Camera:MotionSpline_AddSplinePoint( 405.044159 , 322.350128 , 23.693230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(394.545,328.598,15.280);]] )
   Camera:MotionSpline_AddSplinePoint( 405.044159 , 322.350128 , 23.693230 , 0.000000 , [[Camera:ScriptSplineLookAtPosition(394.545,328.598,15.280);]] )
--<Setup Cursor>-------------------------------------------------------------------------------------------------------
   Camera:MotionSpline_SetMovementLength( 10.000000 )
   Camera:MotionSpline_SetCorrection( 0.429688 )
   Camera:MotionSpline_SetSlowDown( 0.000000 )
